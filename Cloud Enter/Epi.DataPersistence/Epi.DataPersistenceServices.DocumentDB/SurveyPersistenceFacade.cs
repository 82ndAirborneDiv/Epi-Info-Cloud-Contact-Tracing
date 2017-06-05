﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Threading;
using System.Threading.Tasks;
using Epi.Cloud.Common.BusinessObjects;
using Epi.Cloud.Common.Constants;
using Epi.Cloud.Common.Extensions;
using Epi.Cloud.Common.Message;
using Epi.Cloud.Common.Metadata;
using Epi.Cloud.ServiceBus;
using Epi.Common.Core.DataStructures;
using Epi.Common.Core.Interfaces;
using Epi.DataPersistence.Common.Interfaces;
using Epi.DataPersistence.Constants;
using Epi.DataPersistence.DataStructures;
using Epi.DataPersistence.Extensions;
using Epi.DataPersistenceServices.DocumentDB;
using Epi.FormMetadata.DataStructures;
using Microsoft.Azure.Documents;

namespace Epi.PersistenceServices.DocumentDB
{
    public partial class DocDB_SurveyPersistenceFacade : MetadataAccessor, ISurveyPersistenceFacade
    {
        private string AttachmentId = ConfigurationManager.AppSettings[AppSettings.Key.AttachmentId];

        public DocDB_SurveyPersistenceFacade()
        {
        }

        DocumentDbCRUD _formResponseCRUD = new DocumentDbCRUD();

        public FormResponseDetail GetFormResponseState(IResponseContext responseContext)
        {
            var formResponseProperties = _formResponseCRUD.GetFormResponseState(responseContext);
            return formResponseProperties != null ? formResponseProperties.ToFormResponseDetail() : null;
        }

        public bool DoChildResponsesExist(IResponseContext responseContext, bool includeDeletedRecords = false) // string childFormId, string parentResponseId)
        {
            return _formResponseCRUD.DoChildResponsesExist(responseContext, includeDeletedRecords);
        }

        public int GetFormResponseCount(string formId, bool includeDeletedRecords = false)
        {
            return _formResponseCRUD.GetFormResponseCount(formId, includeDeletedRecords);
        }

        public bool UpdateResponseStatus(IResponseContext responseContext, int responseStatus, RecordStatusChangeReason reasonForStatusChange)
        {
            var formId = responseContext.FormId;
            var responseId = responseContext.ResponseId;

            Attachment attachment = null;
            try
            {
                switch (responseStatus)
                {
                    case RecordStatus.Saved:
                        var UpdateAttachmentresult = _formResponseCRUD.UpdateAttachment(responseContext, responseStatus);
                        break;
                    case RecordStatus.Deleted:
                        var UpdateSurveyResponseStatusToDeleteResult = _formResponseCRUD.DeleteResponse(responseContext, RecordStatus.Deleted);
                        //NotifyConsistencyService(responseId, RecordStatus.Deleted, RecordStatusChangeReason.DeleteResponse);
                        break;
                    case RecordStatus.Restore:
                        attachment = _formResponseCRUD.ReadResponseAttachment(responseContext, AttachmentId);
                        if (attachment == null)
                        {
                            //Add new record Don't Save
                            var NewRecordDontSaveResult = _formResponseCRUD.DeleteResponse(responseContext, RecordStatus.PhysicalDelete);
                        }
                        else
                        {
                            //Edit Record Don't Save
                            FormResponseResource formResonseResource = _formResponseCRUD.RetrieveResponseAttachment(attachment);
                            var editRecordDontSaveResult = _formResponseCRUD.RestoreLastResponseSnapshot(formResonseResource);

                            //Delete Attachment                         
                            var deleteResponse = _formResponseCRUD.DeleteAttachment(attachment);
                        }
                        break;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            return true;
        }

        public bool SaveResponse(SurveyResponseBO surveyResponseBO)
        {
            var isSuccessful = _formResponseCRUD.ExecuteWithFollowOnAction(
                () => SaveFormResponseProperties(surveyResponseBO),
                () => {
                        if (surveyResponseBO.Status == RecordStatus.Saved)
                        {
                            NotifyConsistencyService(surveyResponseBO, surveyResponseBO.Status, RecordStatusChangeReason.SubmitOrClose);
                        }
                      });
            return isSuccessful;
        }

        //public bool SaveResponsexxx(SurveyResponseBO surveyResponseBO)
        //{
        //    using (ManualResetEvent completionEvent = new ManualResetEvent(false))
        //    {
        //        bool isSuccessful = false;
        //        Task<bool> isSuccessfulTask = null;

        //        var backgroundTask = Task.Run(() =>
        //        {
        //            isSuccessfulTask = SaveFormResponseProperties(surveyResponseBO);
        //        });

        //        var millisecondsToSleep = 100;
        //        var retries = (Int32)TimeSpan.FromSeconds(5).TotalMilliseconds / millisecondsToSleep;
        //        bool isCompleted = false;
        //        while (retries > 0)
        //        {
        //            if (isSuccessfulTask == null) { Thread.Sleep(10); continue; }
        //            isCompleted = isSuccessfulTask.IsCompleted;
        //            if (isCompleted) break;
        //            Thread.Sleep(millisecondsToSleep);
        //            retries -= 1;
        //        }
        //        isSuccessful = isCompleted;
        //        var awaiter = isSuccessfulTask.ContinueWith(t =>
        //        {
        //            if (surveyResponseBO.Status == RecordStatus.Saved)
        //            {
        //                NotifyConsistencyService(surveyResponseBO, surveyResponseBO.Status, RecordStatusChangeReason.SubmitOrClose);
        //            }
        //            completionEvent.Set();
        //        }, TaskContinuationOptions.AttachedToParent).ConfigureAwait(false);

        //        isSuccessful &= completionEvent.WaitOne(TimeSpan.FromSeconds(5));
        //        awaiter.GetAwaiter().GetResult();
        //        isSuccessful &= isSuccessfulTask.Result;
        //        isSuccessful &= backgroundTask.Wait(TimeSpan.FromSeconds(5));
        //        return isSuccessful;
        //    }
        //}

        #region Save Form Response Properties
        /// <summary>
        /// First time store ResponseId, RecStatus, and SurveyId in DocumentDB
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        private async Task<bool> SaveFormResponseProperties(SurveyResponseBO request)
        {
            ResponseContext responseContext = request.ToResponseContext();
            var formName = responseContext.FormName;
            var now = DateTime.UtcNow;
            FormResponseProperties formResponseProperties = new FormResponseProperties
            {
                ResponseId = responseContext.ResponseId,
                FormId = responseContext.FormId,
                FormName = responseContext.FormName,

                ParentResponseId = responseContext.ParentResponseId,
                ParentFormId = responseContext.ParentFormId,
                ParentFormName = responseContext.ParentFormName,

                RootResponseId = responseContext.RootResponseId,
                RootFormId = responseContext.RootFormId,
                RootFormName = responseContext.RootFormName,

                UserId = responseContext.UserId,
                UserName = request.UserName,

                IsNewRecord = request.Status == RecordStatus.InProcess ? request.IsNewRecord : false,
                RecStatus = request.Status,
                FirstSaveTime = request.ResponseDetail.FirstSaveTime,
                LastSaveTime = now,
                FirstSaveLogonName = request.ResponseDetail.FirstSaveLogonName,
                IsDraftMode = request.IsDraftMode,
                IsLocked = request.IsLocked,
                RequiredFieldsList = request.ResponseDetail.RequiredFieldsList,
                HiddenFieldsList = request.ResponseDetail.HiddenFieldsList,
                HighlightedFieldsList = request.ResponseDetail.HighlightedFieldsList,
                DisabledFieldsList = request.ResponseDetail.DisabledFieldsList,
                ResponseQA = request.ResponseDetail.FlattenedResponseQA()
            };

            bool isSuccessful = false;
            var result = await _formResponseCRUD.SaveFormResponsePropertiesAsync(responseContext, formResponseProperties).ConfigureAwait(false);
            isSuccessful = result.Resource != null;
            return isSuccessful;
        }

		#endregion

		#region DeleteSurveyByResponseId
		public SurveyAnswerResponse DeleteResponse(IResponseContext responseContext)
		{
			bool deleteStatus = UpdateResponseStatus(responseContext, RecordStatus.Deleted, RecordStatusChangeReason.DeleteResponse);
			SurveyAnswerResponse surveyAnsResponse = new SurveyAnswerResponse();
			return surveyAnsResponse;
		}

        #endregion

        #region Get All Responses With Criteria
        public IEnumerable<FormResponseDetail> GetAllResponsesWithCriteria(IResponseContext responseContext, IDictionary<int, FieldDigest> gridFields, IDictionary<int, KeyValuePair<FieldDigest, string>> searchFields, int pageSize = 0, int pageNumber = 0)
        {
            return _formResponseCRUD.GetAllResponsesWithCriteria(responseContext, gridFields, searchFields, null, pageSize, pageNumber);
        }

        public FormResponseDetail GetFormResponseByResponseId(IResponseContext responseContext)
		{
			var response = _formResponseCRUD.GetHierarchicalResponseListByResponseId(responseContext);
			var formResponseDetail = response[0].ToFormResponseDetail();
			return formResponseDetail;
		}
		#endregion

		#region Get Hierarchical Responses for DataConsisitencyServiceAPI
		public FormResponseDetail GetHierarchicalResponsesByResponseId(IResponseContext responseContext, bool includeDeletedRecords = false)
		{
			var hierarchicalDocumentResponseProperties = _formResponseCRUD.GetHierarchicalResponseListByResponseId(responseContext, includeDeletedRecords);
			var hierarchicalFormResponseDetail = hierarchicalDocumentResponseProperties.ToHierarchicalFormResponseDetail();
			return hierarchicalFormResponseDetail;
		}
		#endregion


		#region Notify Consistency Service
		public void NotifyConsistencyService(IResponseContext responseContext, int responseStatus, RecordStatusChangeReason reasonForStatusChange)
		{
			if (responseStatus == RecordStatus.Deleted || responseStatus == RecordStatus.Saved)
			{
				try
				{
					var serviceBusCRUD = new ServiceBusCRUD();
					var hierarchicalResponse = GetHierarchicalResponsesByResponseId(responseContext,includeDeletedRecords: true);
                    var messageHeader = string.Format("{0},{1},{2}", responseContext.RootFormName, responseContext.RootFormId, responseContext.RootResponseId);
					switch (reasonForStatusChange)
					{
						case RecordStatusChangeReason.SubmitOrClose:
						case RecordStatusChangeReason.DeleteResponse:

                            //send notification to ServiceBus
							serviceBusCRUD.SendMessagesToTopic(hierarchicalResponse);
							//ConsistencyHack(hierarchicalResponse);
							break;
					}
				}
				catch (Exception ex)
				{
					Console.WriteLine(ex.ToString());
				}
			}
		}
        #endregion NotifyConsistencyService  
    }
}
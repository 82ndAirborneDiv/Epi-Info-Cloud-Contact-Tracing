﻿using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Epi.Cloud.Resources;
using Epi.Cloud.Resources.Constants;
using Epi.PersistenceServices.DocumentDB;
using Microsoft.Azure.Documents;
using Microsoft.Azure.Documents.Client;

namespace Epi.DataPersistenceServices.DocumentDB
{
    public partial class DocumentDbCRUD
    {
        public int? continuationToken = null;

        private const string spGetRecordsBySurveyId = "GetRecordsBySurveyId";
        private const string udfWildCardCompare = "WildCardCompare";

        /// <summary>
        /// Execute DB SP-Get all records by FormName (aka: collectionId) 
        /// </summary>
        /// <param name="collectionId"></param>
        /// <param name="spId"></param>
        /// <param name="udfId"></param>
        /// <param name="query"></param>
        /// <returns></returns>
        private async Task<List<FormResponseProperties>> GetAllRecordsByFormName(string collectionId, string spId, string udfId, string query)
        {
            return await ExecuteSPAsync(collectionId, spId, udfId, query);
        }

        internal class OrderByResult
        {
            public Document[] Result { get; set; }
            public int? Continuation { get; set; }
        }

        /// <summary>
        /// ExecuteSPAsync
        /// </summary>
        /// <param name="collectionId"></param>
        /// <param name="spId"></param>
        /// <param name="surveyId"></param>
        /// <returns></returns>
        private async Task<List<FormResponseProperties>> ExecuteSPAsync(string collectionId, string spId, string udfId, string query)
        {
            RequestOptions option = new RequestOptions();
            var formResponse = new FormResponseProperties();
            // Create SP Uri
            Uri spUri = UriFactory.CreateStoredProcedureUri(DatabaseName, collectionId, spId);
            Uri udfUri = UriFactory.CreateUserDefinedFunctionUri(DatabaseName, collectionId, udfId);
            Uri collectionUri = UriFactory.CreateDocumentCollectionUri(DatabaseName, collectionId);
            try
            {
                return ExecuteQuery(query, spUri);
            }
            catch (Exception ex)
            {
                var errorCode = ((DocumentClientException)ex.InnerException).Error.Code;
                if (errorCode == "NotFound" || errorCode == "BadRequest")
                {
                    if (await DoesStoredProcedureExist(spUri) == false)
                    {
                        var createSPResponse = await CreateSPAsync(collectionUri, spId);
                    }
                    if (await DoesUserDefinedFunctionExist(udfUri) == false)
                    {
                        var createUDFResponse = await CreateUDFAsync(collectionUri, udfId);
                    }

                    try
                    {
                        return ExecuteQuery(query, spUri);
                    }
                    catch (Exception ex2)
                    {
                    }
                }
            }
            return null;
        }

        private List<FormResponseProperties> ExecuteQuery(string query, Uri spUri)
        {
            var formResponseList = new List<FormResponseProperties>();

            do
            {
                var spResponse = Client.ExecuteStoredProcedureAsync<OrderByResult>(spUri, query).Result;
                foreach (var doc in spResponse.Response.Result)
                {
                    FormResponseProperties formResponse = (dynamic)doc;
                    formResponseList.Add(formResponse);
                }
            } while (continuationToken != null);

            return formResponseList;
        }

        public async Task<bool> DoesStoredProcedureExist(Uri spUri)
        {
            bool exists = false;
            try
            {
                var task = Client.ReadStoredProcedureAsync(spUri);
                while (!task.IsCompleted && !task.IsFaulted) Thread.SpinWait(5);
                var spResult = await task;
                exists = spResult != null && !task.IsFaulted;
            }
            catch (Exception ex)
            {
                exists = false;
            }
            return exists;
        }


        public async Task<bool> DoesUserDefinedFunctionExist(Uri udfUri)
        {
            bool exists = false;
            try
            {
                var task = Client.ReadUserDefinedFunctionAsync(udfUri);
                while (!task.IsCompleted && !task.IsFaulted) Thread.SpinWait(5);
                var udfResult = await task;
                exists = udfResult != null && !task.IsFaulted;
            }
            catch (Exception ex)
            {
                exists = false;
            }
            return exists;
        }

        /// <summary>
        /// Create Document Db Stored Procedure
        /// </summary>
        /// <param name="collectionUri"></param>
        /// <param name="spId"></param>
        /// <returns></returns>
        private async Task<StoredProcedure> CreateSPAsync(Uri collectionUri, string spId)
        {

            try
            {
                var sprocBody = ResourceProvider.GetResourceString(ResourceNamespaces.DocumentDBSp, DocumentDBSPKeys.GetAllRecordsBySurveyID);
                var sprocDefinition = new StoredProcedure
                {
                    Id = spId,
                    Body = sprocBody
                };
                var result = ExecuteWithFollowOnAction(() => Client.CreateStoredProcedureAsync(collectionUri, sprocDefinition));
                return await Task.FromResult(result);
            }
            catch (Exception ex)
            {

            }
            return null;
        }
        /// <summary>
        /// Create Document Db Stored Procedure
        /// </summary>
        /// <param name="collectionUri"></param>
        /// <param name="udfId"></param>
        /// <returns></returns>
        private async Task<UserDefinedFunction> CreateUDFAsync(Uri collectionUri, string udfId)
        {
            try
            {
                var udfBody = ResourceProvider.GetResourceString(ResourceNamespaces.DocumentDBSp, DocumentDBUDFKeys.udfWildCardCompare);
                var udfDefinition = new UserDefinedFunction
                {
                    Id = udfId,
                    Body = udfBody
                };
                var udfTask = Client.CreateUserDefinedFunctionAsync(collectionUri, udfDefinition);
                while (!udfTask.IsCompleted && !udfTask.IsFaulted) Thread.SpinWait(5);
                if (udfTask.IsFaulted) throw new Exception("CreateUserDefinedFunction faulted");
                var response = await udfTask;
                return response.Resource;
            }
            catch (Exception ex)
            {

            }
            return null;
        }
    }
}

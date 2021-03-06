﻿using System;
using System.Collections.Generic;
using System.Linq;
using Epi.Cloud.Common.Metadata;
using Epi.Cloud.Interfaces.DataInterfaces;
using Epi.Cloud.MetadataServices.Common.Extensions;
using Epi.DataPersistence.Common.Interfaces;
using Epi.Web.EF;
using Epi.Cloud.Common.BusinessObjects;

namespace Epi.Cloud.SurveyInfoServices.DAO
{
    /// <summary>
    /// Implementation of the ISurveyInfoDao interface.
    /// </summary>
    public class SurveyInfoDao : MetadataAccessor, ISurveyInfoDao
    {
        private readonly ISurveyPersistenceFacade _surveyPersistenceFacade;

        public SurveyInfoDao(ISurveyPersistenceFacade surveyPersistenceFacade)
        {
            _surveyPersistenceFacade = surveyPersistenceFacade;
        }

		public SurveyInfoBO GetSurveyInfo(string surveyId)
		{
			var formDigest = GetFormDigest(surveyId);
			var surveyInfoBO = formDigest.ToSurveyInfoBO();
			return surveyInfoBO;
		}

		public SurveyInfoBO GetParentInfoByChildId(string childSurveyId)
		{
			var formDigest = GetFormDigest(childSurveyId);
			var surveyInfoBO = formDigest.ToSurveyInfoBO();
			return surveyInfoBO;
		}

		/// <summary>
		/// Gets SurveyInfo based on a list of ids
		/// </summary>
		/// <param name="SurveyInfoId">Unique SurveyInfo identifier.</param>
		/// <returns>SurveyInfo.</returns>
		public List<SurveyInfoBO> GetSurveyInfo(List<string> surveyInfoIdList, int displayPageNumber = -1, int displayPageSize = -1)
		{
			List<SurveyInfoBO> result = new List<SurveyInfoBO>();
			if (surveyInfoIdList.Count > 0)
			{
				try
				{
					foreach (string surveyInfoId in surveyInfoIdList.Distinct())
					{
						var formDigest = GetFormDigest(surveyInfoId);
						var surveyInfoBO = formDigest.ToSurveyInfoBO();
						result.Add(surveyInfoBO);
					}
				}
				catch (Exception ex)
				{
					throw (ex);
				}

				// remove the items to skip
				// remove the items after the page size
				if (displayPageNumber > 0 && displayPageSize > 0)
				{
					result.Sort(CompareByDateCreated);
					// remove the items to skip
					if (displayPageNumber * displayPageSize - displayPageSize > 0)
					{
						result.RemoveRange(0, displayPageSize);
					}

					if (displayPageNumber * displayPageSize < result.Count)
					{
						result.RemoveRange(displayPageNumber * displayPageSize, result.Count - displayPageNumber * displayPageSize);
					}
				}
			}

			return result;
        }

        public SurveyInfoBO GetSurveyInfoState(string surveyInfoId)
        {
            SurveyInfoBO result = new SurveyInfoBO();
            try
            {
                var formDigest = GetFormDigest(surveyInfoId);
                var surveyInfoBO = new SurveyInfoBO();
                surveyInfoBO = formDigest.ToSurveyInfoBO();
                result = surveyInfoBO;
            }
            catch (Exception ex)
            {
                throw (ex);
            }

            return result;
        }

        /// <summary>
        /// Gets SurveyInfo based on criteria
        /// </summary>
        /// <param name="SurveyInfoId">Unique SurveyInfo identifier.</param>
        /// <returns>SurveyInfo.</returns>
        public List<SurveyInfoBO> GetSurveyInfo(List<string> SurveyInfoIdList, DateTime pClosingDate, string pOrganizationKey, int pSurveyType = -1, int PageNumber = -1, int PageSize = -1)
        {
            List<SurveyInfoBO> result = new List<SurveyInfoBO>();

            List<SurveyMetaData> responseList = new List<SurveyMetaData>();

            int OrganizationId = 0;
            try
            {
                //using (var Context = DataObjectFactory.CreateContext())
                //{

                //    OrganizationId =  Context.Organizations.FirstOrDefault(x => x.OrganizationKey == pOrganizationKey).OrganizationId;
                //}
            }
            catch (Exception ex)
            {
                throw (ex);
            }

            if (SurveyInfoIdList.Count > 0)
            {
                foreach (string surveyInfoId in SurveyInfoIdList.Distinct())
                {
                    Guid Id = new Guid(surveyInfoId);
                    try
                    {
                        using (var Context = DataObjectFactory.CreateContext())
                        {
                            //responseList.Add(Context.SurveyMetaDatas.FirstOrDefault(x => x.SurveyId == Id && x.OrganizationId == OrganizationId));
                            responseList.Add(Context.SurveyMetaDatas.FirstOrDefault(x => x.SurveyId == Id));
                        }
                    }
                    catch (Exception ex)
                    {
                        throw (ex);
                    }
                }
            }
            else
            {
                using (var Context = DataObjectFactory.CreateContext())
                {
                    responseList = Context.SurveyMetaDatas.ToList();

                }
            }


            if (responseList.Count > 0 && responseList[0] != null)
            {

                if (pSurveyType > -1)
                {
                    List<SurveyMetaData> statusList = new List<SurveyMetaData>();
                    statusList.AddRange(responseList.Where(x => x.SurveyTypeId == pSurveyType));
                    responseList = statusList;
                }

                if (OrganizationId > 0)
                {
                    List<SurveyMetaData> OIdList = new List<SurveyMetaData>();
                    OIdList.AddRange(responseList.Where(x => x.OrganizationId == OrganizationId));
                    responseList = OIdList;

                }

                if (pClosingDate != null)
                {
                    if (pClosingDate > DateTime.MinValue)
                    {
                        List<SurveyMetaData> dateList = new List<SurveyMetaData>();

                        dateList.AddRange(responseList.Where(x => x.ClosingDate.Month >= pClosingDate.Month && x.ClosingDate.Year >= pClosingDate.Year && x.ClosingDate.Day >= pClosingDate.Day));
                        responseList = dateList;
                    }
                }
                result = Mapper.Map(responseList);

                // remove the items to skip
                // remove the items after the page size
                if (PageNumber > 0 && PageSize > 0)
                {
                    result.Sort(CompareByDateCreated);

                    if (PageNumber * PageSize - PageSize > 0)
                    {
                        result.RemoveRange(0, PageSize);
                    }

                    if (PageNumber * PageSize < result.Count)
                    {
                        result.RemoveRange(PageNumber * PageSize, result.Count - PageNumber * PageSize);
                    }
                }
            }
            return result;
        }

        public List<SurveyInfoBO> GetSurveyInfoByOrgKeyAndPublishKey(string SurveyId, string Okey, Guid publishKey)
        {
            List<SurveyInfoBO> result = new List<SurveyInfoBO>();

            List<SurveyMetaData> responseList = new List<SurveyMetaData>();

            int OrganizationId = 0;
            try
            {
                using (var Context = DataObjectFactory.CreateContext())
                {

                    var Query = (from response in Context.Organizations
                                 where response.OrganizationKey == Okey
                                 select response).SingleOrDefault();

                    if (Query != null)
                    {
                        OrganizationId = Query.OrganizationId;
                    }

                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }

            if (!string.IsNullOrEmpty(SurveyId))
            {
                try
                {
                    Guid Id = new Guid(SurveyId);
                    using (var Context = DataObjectFactory.CreateContext())
                    {
                        responseList.Add(Context.SurveyMetaDatas.FirstOrDefault(x => x.SurveyId == Id && x.OrganizationId == OrganizationId && x.UserPublishKey == publishKey));
                        if (responseList[0] != null)
                        {
                            result = Mapper.Map(responseList);
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw (ex);
                }
            }

            return result;
        }


        public List<SurveyInfoBO> GetSurveyInfoByOrgKey(string SurveyId, string Okey)
        {
            List<SurveyInfoBO> result = new List<SurveyInfoBO>();

            List<SurveyMetaData> responseList = new List<SurveyMetaData>();

            int OrganizationId = 0;
            try
            {
                using (var Context = DataObjectFactory.CreateContext())
                {

                    var Query = (from response in Context.Organizations
                                 where response.OrganizationKey == Okey
                                 select response).SingleOrDefault();

                    if (Query != null)
                    {
                        OrganizationId = Query.OrganizationId;
                    }

                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }

            if (!string.IsNullOrEmpty(SurveyId))
            {
                try
                {
                    Guid Id = new Guid(SurveyId);
                    using (var Context = DataObjectFactory.CreateContext())
                    {
                        responseList.Add(Context.SurveyMetaDatas.FirstOrDefault(x => x.SurveyId == Id && x.OrganizationId == OrganizationId));
                        if (responseList[0] != null)
                        {
                            result = Mapper.Map(responseList);
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw (ex);
                }
            }

            return result;
        }





        /// <summary>
        /// Inserts a new SurveyInfo. 
        /// </summary>
        /// <remarks>
        /// Following insert, SurveyInfo object will contain the new identifier.
        /// </remarks>  
        /// <param name="SurveyInfo">SurveyInfo.</param>
        public void InsertSurveyInfo(SurveyInfoBO SurveyInfo)
        {
            throw new NotImplementedException("InsertSurveyInfo is not implemented");

            //int OrganizationId = 0;
            //try
            //{
            //    using (var Context = DataObjectFactory.CreateContext())
            //    {

            //        //retrieve OrganizationId based on OrganizationKey
            //        using (var ContextOrg = DataObjectFactory.CreateContext())
            //        {
            //            string OrgKey = Epi.Common.Security.Cryptography.Encrypt(SurveyInfo.OrganizationKey.ToString());
            //            OrganizationId = ContextOrg.Organizations.FirstOrDefault(x => x.OrganizationKey == OrgKey).OrganizationId;
            //        }

            //        SurveyInfo.DateCreated = DateTime.Now;



            //        var SurveyMetaDataEntity = Mapper.Map(SurveyInfo);
            //        User User = Context.Users.FirstOrDefault(x => x.UserID == SurveyInfo.OwnerId);
            //        SurveyMetaDataEntity.Users.Add(User);

            //        SurveyMetaDataEntity.OrganizationId = OrganizationId;
            //        Context.AddToSurveyMetaDatas(SurveyMetaDataEntity);

            //        Context.SaveChanges();
            //    }
            //}
            //catch (Exception ex)
            //{
            //    throw (ex);
            //}
        }

        /// <summary>
        /// Updates a SurveyInfo.
        /// </summary>
        /// <param name="SurveyInfo">SurveyInfo.</param>
        public void UpdateSurveyInfo(SurveyInfoBO SurveyInfo)
        {
            try
            {
                Guid Id = new Guid(SurveyInfo.SurveyId);

                //Update Survey
                using (var Context = DataObjectFactory.CreateContext())
                {
                    //var Query = from response in Context.SurveyMetaDatas
                    //            where response.SurveyId == Id
                    //            select response;

                    //var DataRow = Query.Single();
                    //DataRow = Mapper.ToEF(SurveyInfo);

                    SurveyMetaData Row = Context.SurveyMetaDatas.First(x => x.SurveyId == Id);
                    Row.IsSQLProject = SurveyInfo.IsSqlProject;
                    Row.IsDraftMode = SurveyInfo.IsDraftMode;
                    Row.IsShareable = SurveyInfo.IsShareable;
                    Row.DataAccessRuleId = SurveyInfo.DataAccessRuleId;
                    Context.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        /// <summary>
        /// Deletes a SurveyInfo
        /// </summary>
        /// <param name="SurveyInfo">SurveyInfo.</param>
        public void DeleteSurveyInfo(SurveyInfoBO SurveyInfo)
        {

            //Delete Survey
        }

        /// <summary>
        /// Gets SurveyInfo Size Data on a list of ids
        /// </summary>
        /// <param name="SurveyInfoId">Unique SurveyInfo identifier.</param>
        /// <returns>PageInfoBO.</returns>
        public List<SurveyInfoBO> GetSurveySizeInfo(List<string> SurveyInfoIdList, int displayPageNumber = -1, int displayPageSize = -1, int ResponseMaxSize = -1)
        {
            List<SurveyInfoBO> resultRows = GetSurveyInfo(SurveyInfoIdList, displayPageNumber, displayPageSize);
            return resultRows;
        }


        /// <summary>
        /// Gets SurveyInfo Size Data based on criteria
        /// </summary>
        /// <param name="SurveyInfoId">Unique SurveyInfo identifier.</param>
        /// <returns>PageInfoBO.</returns>
        public List<SurveyInfoBO> GetSurveySizeInfo(List<string> SurveyInfoIdList, DateTime pClosingDate, string Okey, int pSurveyType = -1, int PageNumber = -1, int PageSize = -1, int ResponseMaxSize = -1)
        {
            List<SurveyInfoBO> resultRows = GetSurveyInfo(SurveyInfoIdList, pClosingDate, Okey, pSurveyType, PageNumber, PageSize);
            return resultRows;
        }

        private static int CompareByDateCreated(SurveyInfoBO x, SurveyInfoBO y)
        {
            return x.DateCreated.CompareTo(y.DateCreated);
        }

        public static string RemoveWhitespace(string xml)
        {
            System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(@">\s*<");
            xml = regex.Replace(xml, "><");

            return xml.Trim();
        }

        public List<SurveyInfoBO> GetChildInfoByParentId(string ParentFormId, int ViewId)
        {
			var surveyInfoBOs = FormDigests.Where(d => d.ParentFormId == ParentFormId && d.ViewId == ViewId).Select(d => d.ToSurveyInfoBO()).ToList();
			
            //List<SurveyInfoBO> result = new List<SurveyInfoBO>();
            //try
            //{

            //    Guid Id = new Guid(ParentFormId);

            //    using (var Context = DataObjectFactory.CreateContext())
            //    {
            //        result.Add(Mapper.Map(Context.SurveyMetaDatas.FirstOrDefault(x => x.ParentId == Id && x.ViewId == ViewId)));
            //    }

            //}
            //catch (Exception ex)
            //{
            //    throw (ex);
            //}
            return surveyInfoBOs;
        }

        public List<SurveyInfoBO> GetFormsHierarchyIdsByRootFormId(string rootFormId)
        {
            List<SurveyInfoBO> result = new List<SurveyInfoBO>();

            try
            {
                var metadatAccessor = new MetadataAccessor(rootFormId);
                var formDigests = metadatAccessor.GetFormDigestsInRootFormHierarchy(rootFormId);
                result = formDigests.ToSurveyInfoBOList();
            }
            catch (Exception ex)
            {
                throw (ex);
            }
            return result;
        }

        public void InsertFormDefaultSettings(string formId, bool isSqlProject, List<string> controlsNameList)
        {
#if false
            try
            {
                //Delete old columns
                using (var Context = DataObjectFactory.CreateContext())
                {
                    Guid Id = new Guid(formId);
                    IQueryable<ResponseDisplaySetting> ColumnList = Context.ResponseDisplaySettings.Where(x => x.FormId == Id);


                    foreach (var item in ColumnList)
                    {
                        Context.ResponseDisplaySettings.DeleteObject(item);
                    }
                    Context.SaveChanges();
                }
                // Adding new columns
                List<string> ColumnNames = new List<string>();
                if (!isSqlProject)
                {
                    ColumnNames = MetaDaTaColumnNames();
                }
                else
                {
                    ColumnNames = controlsNameList;
                }
                int i = 1;
                foreach (string Column in ColumnNames)
                {

                    using (var Context = DataObjectFactory.CreateContext())
                    {

                        ResponseDisplaySetting SettingEntity = Mapper.Map(formId, i, Column);

                        Context.AddToResponseDisplaySettings(SettingEntity);

                        Context.SaveChanges();

                    }
                    i++;
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
#endif
        }
        public void UpdateParentId(string SurveyId, int ViewId, string ParentId)
        {
            try
            {
                Guid Id = new Guid(SurveyId);
                Guid PId = new Guid(ParentId);

                //Update Survey
                using (var Context = DataObjectFactory.CreateContext())
                {
                    var Query = from Form in Context.SurveyMetaDatas
                                where Form.SurveyId == Id && Form.ViewId == ViewId
                                select Form;

                    var DataRow = Query.Single();
                    DataRow.ParentId = PId;
                    Context.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

        public void InsertConnectionString(DbConnectionStringBO ConnectionString)
        {
            try
            {


                using (var Context = DataObjectFactory.CreateContext())
                {
                    Context.usp_AddDatasource(ConnectionString.DatasourceServerName, ConnectionString.DatabaseType, ConnectionString.InitialCatalog, ConnectionString.PersistSecurityInfo, ConnectionString.DatabaseUserID, ConnectionString.SurveyId, ConnectionString.Password);

                    Context.SaveChanges();

                }

            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public void UpdateConnectionString(DbConnectionStringBO ConnectionString)
        {
            try
            {


                using (var Context = DataObjectFactory.CreateContext())
                {
                    var Query = from DataSource in Context.EIDatasources
                                where DataSource.SurveyId == ConnectionString.SurveyId
                                select DataSource;

                    var DataRow = Query.Single();
                    DataRow = Mapper.Map(ConnectionString);

                    Context.AddToEIDatasources(DataRow);

                    Context.SaveChanges();

                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

    }
}

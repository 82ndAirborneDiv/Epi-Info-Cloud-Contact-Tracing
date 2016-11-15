﻿using System.Collections.Generic;
using System.Linq;
using Epi.Web.Enter.Common.BusinessObject;
using Epi.Web.Enter.Common.DTO;

namespace Epi.Web.Enter.Common.Extensions
{
    public static class SurveyInfoBOExtensions
    {
        public static FormInfoDTO ToFormInfoDTO(this SurveyInfoBO surveyInfoBO)
        {
            return new FormInfoDTO
            {
                IsSQLProject = surveyInfoBO.IsSqlProject,
                FormId = surveyInfoBO.SurveyId,
                FormNumber = surveyInfoBO.SurveyNumber,
                FormName = surveyInfoBO.SurveyName,
                OrganizationName = surveyInfoBO.OrganizationName,
                OwnerId = surveyInfoBO.OwnerId,
                IsDraftMode = surveyInfoBO.IsDraftMode
            };
        }


        public static FormsHierarchyBO ToFormsHierarchyBO(this SurveyInfoBO surveyInfoBO, string rootId)
        {
            return new FormsHierarchyBO
            {
                RootFormId = rootId,
                FormId = surveyInfoBO.SurveyId,
                ViewId = surveyInfoBO.ViewId,
                SurveyInfo = surveyInfoBO,
                IsRoot = surveyInfoBO.SurveyId == rootId
            };
        }

        public static List<FormsHierarchyBO> ToFormsHierarchyBOList(this List<SurveyInfoBO> surveyInfoBOList, string rootId)
        {
            return surveyInfoBOList.Select(surveyInfoBO => surveyInfoBO.ToFormsHierarchyBO(rootId)).ToList();
        }

        public static SurveyInfoDTO ToSurveyInfoDTO(this SurveyInfoBO surveyInfoBO)
        {
            return new Epi.Web.Enter.Common.DTO.SurveyInfoDTO
            {
                SurveyId = surveyInfoBO.SurveyId,
                SurveyNumber = surveyInfoBO.SurveyNumber,
                SurveyName = surveyInfoBO.SurveyName,
                OrganizationName = surveyInfoBO.OrganizationName,
                DepartmentName = surveyInfoBO.DepartmentName,
                IntroductionText = surveyInfoBO.IntroductionText,
                ExitText = surveyInfoBO.ExitText,
                IsShareable = surveyInfoBO.IsShareable,
                IsShared = surveyInfoBO.IsShared,
                IsSqlProject = surveyInfoBO.IsSqlProject,
                ClosingDate = surveyInfoBO.ClosingDate,
                UserPublishKey = surveyInfoBO.UserPublishKey,
                IsDraftMode = surveyInfoBO.IsDraftMode,
                StartDate = surveyInfoBO.StartDate,
                ViewId = surveyInfoBO.ViewId,
                OwnerId = surveyInfoBO.OwnerId,
                ParentId = surveyInfoBO.ParentId,
                HasDraftModeData = surveyInfoBO.HasDraftModeData
            };
        }

        public static List<SurveyInfoDTO> ToDataTransferObject(this List<SurveyInfoBO> surveyInfoBOList)
        {
            return surveyInfoBOList.Select(surveyInfoBO => surveyInfoBO.ToSurveyInfoDTO()).ToList();
        }


    }
}

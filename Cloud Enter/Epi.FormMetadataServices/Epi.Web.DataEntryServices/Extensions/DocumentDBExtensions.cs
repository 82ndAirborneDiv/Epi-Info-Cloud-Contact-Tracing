﻿using System;
using System.Collections.Generic;
using Epi.Cloud.Common.EntityObjects;
using Epi.Cloud.DataEntryServices.Model;

namespace Epi.Cloud.DataEntryServices.Extensions
{
    public static class DocumentDBExtensions
    {
        public static PageResponseDetail ToPageResponseDetail(this PageResponseProperties pageResponseDetailResource, FormResponseDetail formResponseDetail)
        {
            return pageResponseDetailResource.ToPageResponseDetail(formResponseDetail.FormId, formResponseDetail.FormName);
        }

        public static PageResponseDetail ToPageResponseDetail(this PageResponseProperties pageResponseDetailResource, string formId, string formName)
        {
            var pageResponseDetail = new PageResponseDetail
            {
                GlobalRecordID = pageResponseDetailResource.GlobalRecordID,
                FormId = formId,
                FormName = formName,
                PageId = pageResponseDetailResource.PageId,
                ResponseQA = pageResponseDetailResource.ResponseQA
            };
            return pageResponseDetail;
        }

        public static FormResponseDetail ToFormResponseDetail(this DocumentResponseProperties documentResponseProperties)
        {
            FormResponseDetail formResponseDetail = null;

            var formResponseProperties = documentResponseProperties.FormResponseProperties;
            if (formResponseProperties != null)
            {
                formResponseDetail = formResponseProperties.ToFormResponseDetail();
                if (documentResponseProperties.PageResponsePropertiesList != null)
                {
                    foreach (var pageResponseProperties in documentResponseProperties.PageResponsePropertiesList)
                    {
                        var pageResponseDetail = pageResponseProperties.ToPageResponseDetail(formResponseDetail);
                        formResponseDetail.AddPageResponseDetail(pageResponseDetail);
                    }
                }
            }

            return formResponseDetail;
        }

        public static FormResponseDetail ToFormResponseDetail(this FormResponseProperties formResponseProperties)
        {
            var formResponseDetail = new FormResponseDetail
            {
                GlobalRecordID = formResponseProperties.GlobalRecordID,

                FormId = formResponseProperties.FormId,
                FormName = formResponseProperties.FormName,
                RecStatus = formResponseProperties.RecStatus,
                RelateParentResponseId = formResponseProperties.RelateParentId,
                FirstSaveLogonName = formResponseProperties.FirstSaveLogonName,
                LastSaveLogonName = formResponseProperties.LastSaveLogonName,
                FirstSaveTime = formResponseProperties.FirstSaveTime,
                LastSaveTime = formResponseProperties.LastSaveTime,

                LastActiveUserId = formResponseProperties.UserId,
                IsRelatedView = formResponseProperties.IsRelatedView,
                IsDraftMode = formResponseProperties.IsDraftMode,
                PageIds = formResponseProperties.PageIds
            };

            return formResponseDetail;
        }
    }
}

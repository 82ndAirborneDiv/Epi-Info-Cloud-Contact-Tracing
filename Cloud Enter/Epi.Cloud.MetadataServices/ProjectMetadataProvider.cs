﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Epi.Cloud.CacheServices;
using Epi.Cloud.Common;
using Epi.Cloud.Common.Metadata;
using Epi.Cloud.Interfaces.MetadataInterfaces;
using Epi.Cloud.MetadataServices.Common;
using Epi.FormMetadata.DataStructures;

namespace Epi.Cloud.MetadataServices
{
    public class ProjectMetadataProvider : IProjectMetadataProvider
    {
        private static object ConcurrencyGate = new object();

        private static Guid _projectGuid;
        private readonly IEpiCloudCache _epiCloudCache;
        public ProjectMetadataProvider(IEpiCloudCache epiCloudCache)
        {
            _epiCloudCache = epiCloudCache;
        }

        public IEpiCloudCache Cache { get { return _epiCloudCache; } }

        public string ProjectId { get { return _projectGuid.ToString("N");  } }

        public Guid ProjectGuid { get { return _projectGuid; } }


        public string GetProjectId_RetrieveProjectIfNecessary()
        {
            lock (ConcurrencyGate)
            {
                if (_projectGuid == Guid.Empty)
                {
                    var metadata = RefreshCache(Guid.Empty);
                }
                return ProjectId;
            }
        }


        //Pass the project id and call the DBAccess API and get the project metadata.

        public async Task<Template> GetProjectMetadataAsync()
        {
            lock (ConcurrencyGate)
            {
                Template metadata = null;
                metadata = RefreshCache(ProjectGuid);
                if (metadata == null)
                {
                    Template fullMetadata = null;
                    fullMetadata = RefreshCache(ProjectGuid);
                    _projectGuid = new Guid(fullMetadata.Project.Id);

                    metadata = fullMetadata;
                }
                return metadata;
            }
        }

        //public Task<Template> GetProjectMetadataAsync(string formId, ProjectScope scope)
        //{
        //    var metadataProvider = new MetadataProvider();
        //    Template metadata = metadataProvider.RetrieveProjectMetadata(ProjectGuid).Result;
        //    if (scope == ProjectScope.TemplateWithAllPages)
        //    {
        //        return GetProjectMetadataAsync();
        //    }
        //    return GetProjectMetadataWithPageByPageNumberAsync(formId, null);
        //}

        public async Task<Page> GetPageMetadataAsync(string formId, int pageId)
        {
            var metadata = _epiCloudCache.GetPageMetadata(ProjectGuid, new Guid(formId), pageId);
            if (metadata == null)
            {
                var fullMetadata = RefreshCache(ProjectGuid);
                metadata = _epiCloudCache.GetPageMetadata(ProjectGuid, new Guid(formId), pageId);
            }
            return await Task.FromResult(metadata);
        }

        public async Task<FormDigest[]> GetFormDigestsAsync()
        {
            var formDigests = ProjectId != null ? _epiCloudCache.GetFormDigests(ProjectGuid) : null;
            if (formDigests == null)
            {
                var fullMetadata = RefreshCache(ProjectGuid);

                formDigests = _epiCloudCache.GetFormDigests(ProjectGuid);
            }
            return await Task.FromResult(formDigests);
        }

        public async Task<FormDigest> GetFormDigestAsync(string formId)
        {
            var formDigests = ProjectId != null ? _epiCloudCache.GetFormDigests(ProjectGuid) : null;
            if (formDigests == null)
            {
                var fullMetadata =  RefreshCache(ProjectGuid);

                formDigests = _epiCloudCache.GetFormDigests(ProjectGuid);
            }
            var formDigest = formDigests != null ? formDigests.Where(d => CaseInsensitiveEqualityComparer.Instance.Equals(d.FormId, formId)).SingleOrDefault() : null;
            return await Task.FromResult(formDigest);
        }

        public async Task<PageDigest[][]> GetProjectPageDigestsAsync()
        {
            var projectPageDigests = ProjectId != null ? _epiCloudCache.GetProjectPageDigests(ProjectGuid) : null;
            if (projectPageDigests == null)
            {
                var fullMetadata = RefreshCache(ProjectGuid);
                projectPageDigests = fullMetadata.Project.FormPageDigests;
            }
            return await Task.FromResult(projectPageDigests);
        }

        public async Task<PageDigest[]> GetPageDigestsAsync(string formId)
        {
            var pageDigests = _epiCloudCache.GetPageDigests(ProjectGuid, new Guid(formId));
            if (pageDigests == null)
            {
                var projectPageDigests = GetProjectPageDigestsAsync().Result;
                foreach (var projectPageDigest in projectPageDigests)
                {
                    if (projectPageDigest[0].FormId == formId)
                    {
                        pageDigests = projectPageDigest;
                    }
                }
            }
            return await Task.FromResult(pageDigests);
        }

        public async Task<FieldDigest> GetFieldDigestAsync(string formId, string fieldName)
        {
            fieldName = fieldName.ToLower();
            var pageDigests = await GetPageDigestsAsync(formId);

            foreach (var pageDigest in pageDigests)
            {
                var field = pageDigest.Fields.Where(f => f.FieldName.ToLower() == fieldName).SingleOrDefault();
                if (field != null)
                {
                    return new FieldDigest(field, pageDigest);
                }
            }
            return null;
        }

        public async Task<FieldDigest[]> GetFieldDigestsAsync(string formId)
        {
            formId = formId.ToLower();
            List<FieldDigest> fieldDigests = new List<FieldDigest>();
            var pageDigests = await GetPageDigestsAsync(formId);
            foreach (var pageDigest in pageDigests)
            {
                fieldDigests.AddRange(pageDigest.Fields.Select(field => new FieldDigest(field, pageDigest)));
            }
            return fieldDigests.ToArray();
        }

        public async Task<FieldDigest[]> GetFieldDigestsAsync(string formId, IEnumerable<string> fieldNames)
        {
            formId = formId.ToLower();
            List<string> fieldNameList = fieldNames.Select(n => n.ToLower()).ToList();
            List<string> remainingFieldNamesList = fieldNames.Select(n => n.ToLower()).ToList();
            List<FieldDigest> fieldDigests = new List<FieldDigest>();
            int fieldNamesCount = fieldNames.Count();
            var pageDigests = await GetPageDigestsAsync(formId);
            foreach (var pageDigest in pageDigests)
            {
                fieldNameList = remainingFieldNamesList.ToList();
                foreach (string fieldName in fieldNameList)
                {
                    AbridgedFieldInfo field = pageDigest.Fields.Where(f => f.FieldName.ToLower() == fieldName).SingleOrDefault();
                    if (field != null)
                    {
                        fieldDigests.Add(new FieldDigest(field, pageDigest));
                        remainingFieldNamesList.Remove(fieldName);
                    }
                }
                if (remainingFieldNamesList.Count == 0) break;
            }
            return fieldDigests.ToArray();
        }

        private Template RefreshCache(Guid projectId)
        {
            lock (ConcurrencyGate)
            {
                var metadataProvider = new MetadataProvider();
                Template metadata = metadataProvider.RetrieveProjectMetadata(projectId).Result;
                if (metadata != null) _projectGuid = Guid.Parse(metadata.Project.Id);
                _epiCloudCache.SetProjectTemplateMetadata(metadata);
                return metadata;
            }
        }

        //        private async Task<Template> RetrieveProjectMetadata(Guid projectId)
        //        {

        //            Template metadata = RetriveMetadataFromBlobStorage(projectId);
        //            if (metadata == null)
        //            {
        //                metadata = await RetrieveProjectMetadataViaAPI(projectId);
        //                SaveMetadata(metadata);
        //            }
        //            return metadata;
        //        }

        //        private async Task<Template> RetrieveProjectMetadataViaAPI(Guid projectId)
        //        {
        //            ProjectMetadataServiceProxy serviceProxy = new ProjectMetadataServiceProxy();
        //            var metadata = await serviceProxy.GetProjectMetadataAsync(projectId.ToString("N"));
        //            _projectGuid = metadata != null ? new Guid(metadata.Project.Id) : Guid.Empty;
        //#if CaptureMetadataJson
        //            var metadataFromService = Newtonsoft.Json.JsonConvert.SerializeObject(metadata);
        //            if (!System.IO.Directory.Exists(@"C:\Junk")) System.IO.Directory.CreateDirectory(@"C:\Junk");
        //            System.IO.File.WriteAllText(@"C:\Junk\ZikaMetadataFromService.json", metadataFromService);

        //            var json = System.IO.File.ReadAllText(@"C:\Junk\ZikaMetadataFromService.json");
        //            Template metadataObject = Newtonsoft.Json.JsonConvert.DeserializeObject<Template>(json);
        //#endif
        //            PopulateRequiredPageLevelSourceTables(metadata);
        //            GenerateDigests(metadata);

        //            return metadata;
        //        }

        //        private Template RetriveMetadataFromBlobStorage(Guid projectId)
        //        {
        //            Template metadata = null;
        //            if (projectId == Guid.Empty)
        //            {
        //                var containerName = AppSettings.GetStringValue(AppSettings.Key.MetadataBlogContainerName);
        //                _metadataBlobCRUD = _metadataBlobCRUD ?? new MetadataBlobService.MetadataBlobCRUD(containerName);
        //                var metadataBlobs = _metadataBlobCRUD.GetBlobList();
        //                if (metadataBlobs.Count > 0)
        //                {
        //                    Guid.TryParse(metadataBlobs.First(), out projectId);
        //                }
        //            }
        //            if (projectId != Guid.Empty)
        //            {
        //                var json = _metadataBlobCRUD.DownloadText(projectId.ToString("N"));
        //                metadata = Newtonsoft.Json.JsonConvert.DeserializeObject<Template>(json);
        //            }

        //            return metadata;
        //        }

        //        private void SaveMetadata(Template metadata)
        //        {
        //            var metadataWithDigestsJson = Newtonsoft.Json.JsonConvert.SerializeObject(metadata);

        //#if CaptureMetadataJson
        //            if (!System.IO.Directory.Exists(@"C:\Junk")) System.IO.Directory.CreateDirectory(@"C:\Junk");
        //            System.IO.File.WriteAllText(@"C:\Junk\ZikaMetadataWithDigests.json", metadataWithDigests);
        //#endif

        //            SaveMetadataToBlobStorage(metadata, metadataWithDigestsJson);
        //        }

        //        private void SaveMetadataToBlobStorage(Template metadata, string metadataWithDigestsJson)
        //        {
        //            if (_metadataBlobCRUD == null)
        //            {
        //                var containerName = AppSettings.GetStringValue(AppSettings.Key.MetadataBlogContainerName);
        //                _metadataBlobCRUD = new MetadataBlobService.MetadataBlobCRUD(containerName);
        //            }
        //            var projectKey = new Guid(metadata.Project.Id).ToString("N");

        //            _metadataBlobCRUD.DeleteBlob(projectKey);

        //            var blobMetadataDictionary = new Dictionary<string, string>();
        //            blobMetadataDictionary.Add(BlobMetadataKeys.ProjectId, metadata.Project.Id);
        //            blobMetadataDictionary.Add(BlobMetadataKeys.ProjectName, metadata.Project.Name);
        //            blobMetadataDictionary.Add(BlobMetadataKeys.Description, string.IsNullOrWhiteSpace(metadata.Project.Description) ? metadata.Project.Name : metadata.Project.Description);
        //            StringBuilder sb = new StringBuilder();
        //            foreach (var form in metadata.Project.FormDigests)
        //            {
        //                if (sb.Length > 0) sb.Append(",");
        //                sb.AppendFormat("{0}({1} page{2})", form.FormName, form.NumberOfPages, form.NumberOfPages == 1 ? "" : "s");
        //            }
        //            string forms = sb.ToString();
        //            blobMetadataDictionary.Add(BlobMetadataKeys.Forms, forms);
        //            var isUploadBlobSuccessful = _metadataBlobCRUD.UploadText(metadataWithDigestsJson, projectKey, blobMetadataDictionary);
        //            var metadataList = _metadataBlobCRUD.GetBlobListWithKeys(BlobMetadataKeys.ProjectName, BlobMetadataKeys.Forms);
        //            metadataList = _metadataBlobCRUD.GetBlobList(Microsoft.WindowsAzure.Storage.Blob.BlobListingDetails.Metadata);
        //        }

        //        private void GenerateDigests(Template projectTemplateMetadata)
        //        {
        //            projectTemplateMetadata.Project.FormDigests = projectTemplateMetadata.ToFormDigests();
        //            projectTemplateMetadata.Project.FormPageDigests = projectTemplateMetadata.ToPageDigests();
        //        }


        //        private void PopulateRequiredPageLevelSourceTables(Template metadata)
        //        {
        //            foreach (var view in metadata.Project.Views)
        //            {
        //                var numberOfPages = view.Pages.Length;
        //                for (int i = 0; i < numberOfPages; ++i)
        //                {
        //                    var pageMetadata = view.Pages[i];
        //                    var pageId = pageMetadata.PageId.Value;
        //                    var fieldsRequiringSourceTable = pageMetadata.Fields.Where(f => !string.IsNullOrEmpty(f.SourceTableName));
        //                    foreach (var field in fieldsRequiringSourceTable)
        //                    {
        //                        field.SourceTableValues = metadata.SourceTables.Where(st => st.TableName == field.SourceTableName).First().Values;
        //                    }
        //                }
        //            }
        //        }
    }
 }

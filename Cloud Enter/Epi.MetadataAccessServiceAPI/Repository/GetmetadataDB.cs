﻿using System.Data;
using System.Threading.Tasks;
using Epi.Cloud.SqlServer;
using Epi.FormMetadata.DataStructures;

namespace Epi.MetadataAccessService.Repository
{
    public class GetmetadataDB
    {
        //Call the Cloud EF and get the meta data
        public async Task<Template> MetaDataAsync(string projectId)
        {            
            DataTable dt = new DataTable();

            // Retrive the Template level Attributes
            Metadata metaDt = new Metadata();
            Template lstMetaDataFieldsAtr = new Template();

            //Get the meta data using entity framework
            lstMetaDataFieldsAtr = metaDt.GetProjectTemplateMetadata(projectId);         

            return await Task.FromResult(lstMetaDataFieldsAtr);
        }
    }
}
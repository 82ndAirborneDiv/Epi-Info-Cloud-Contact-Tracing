﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;
using Epi.Cloud.Common.EntityObjects;

namespace Epi.Web.MVC.Utility
{
    public class SurveyResponseXML
    {
        private IEnumerable<XElement> PageFields;
        private string RequiredList = "";

        public string _RequiredList
        {
            get { return RequiredList; }
            set { RequiredList = value; }
        }

        public SurveyResponseXML(IEnumerable<XElement> _PageFields, string _RequiredList)
        {

            PageFields = _PageFields;
            RequiredList = _RequiredList;

        }
        public SurveyResponseXML()
        {
        }
        Dictionary<string, string> ResponseDetailList = new Dictionary<string, string>();


        public void Add(MvcDynamicForms.Form pForm)
        {
            ResponseDetailList.Clear();
            foreach (var field in pForm.InputFields)
            {
                if (!field.IsPlaceHolder)
                {
                    if (this.ResponseDetailList.ContainsKey(field.Title))
                    {
                        this.ResponseDetailList[field.Title] = field.Response;
                    }
                    else
                    {
                        this.ResponseDetailList.Add(field.Title, field.Response);
                    }
                }
            }
        }

        public void Add(MvcDynamicForms.Fields.InputField pField)
        {
            if (this.ResponseDetailList.ContainsKey(pField.Title))
            {
                this.ResponseDetailList[pField.Title] = pField.GetXML();
            }
            else
            {
                this.ResponseDetailList.Add(pField.Title, pField.GetXML());
            }
        }

        public void SetValue(string pKey, string pXMLValue)
        {
            if (this.ResponseDetailList.ContainsKey(pKey))
            {
                this.ResponseDetailList[pKey] = pXMLValue;
            }
            else
            {
                this.ResponseDetailList.Add(pKey, pXMLValue);
            }
        }


        public string GetValue(string pKey)
        {
            string result = null;

            if (this.ResponseDetailList.ContainsKey(pKey))
            {
                result = this.ResponseDetailList[pKey];
            }

            return result;
        }

        public XmlDocument CreateResponseXml(string SurveyId, bool AddRoot, int CurrentPage, string Pageid)
        {
            XmlDocument xml = new XmlDocument();
            XmlElement root = xml.CreateElement("SurveyResponse");

            if (CurrentPage == 0)
            {

                root.SetAttribute("SurveyId", SurveyId);
                root.SetAttribute("LastPageVisited", "1");
                root.SetAttribute("HiddenFieldsList", "");
                root.SetAttribute("HighlightedFieldsList", "");
                root.SetAttribute("DisabledFieldsList", "");
                root.SetAttribute("RequiredFieldsList", "");

                xml.AppendChild(root);
            }

            XmlElement PageRoot = xml.CreateElement("Page");
            if (CurrentPage != 0)
            {


                PageRoot.SetAttribute("PageNumber", CurrentPage.ToString());
                //PageRoot.SetAttribute("PageId", Pageid);//Added PageId Attribute to the page node
                PageRoot.SetAttribute("PageId", CurrentPage.ToString());//Added PageId Attribute to the page node
                PageRoot.SetAttribute("MetaDataPageId", Pageid.ToString());
                xml.AppendChild(PageRoot);
            }

            foreach (KeyValuePair<string, string> pair in this.ResponseDetailList)
            {
                XmlElement child = xml.CreateElement(Epi.Web.MVC.Constants.Constant.RESPONSE_DETAILS);
                child.SetAttribute("QuestionName", pair.Key);
                child.InnerText = pair.Value;
                PageRoot.AppendChild(child);
            }


            return xml;
        }
        public int GetNumberOfPages(XDocument Xml)
        {
            var _FieldsTypeIDs = from _FieldTypeID in
                                     Xml.Descendants("View")
                                 select _FieldTypeID;

            return _FieldsTypeIDs.Elements().Count();
        }
        public string CreateResponseDocument(XDocument pMetaData, string pXML)
        {
            XDocument XmlResponse = new XDocument();
            int NumberOfPages = GetNumberOfPages(pMetaData);
            for (int i = 0; NumberOfPages > i - 1; i++)
            {
                var _FieldsTypeIDs = from _FieldTypeID in
                                         pMetaData.Descendants("Field")
                                     where _FieldTypeID.Attribute("Position").Value == (i - 1).ToString()
                                     select _FieldTypeID;

                this.PageFields = _FieldsTypeIDs;
                string PageId;
                if (this.PageFields.Count() > 0)
                {
                    PageId = this.PageFields.First().Attribute("PageId").Value;
                }
                else
                {
                    PageId = "";
                }

                XDocument CurrentPageXml = ToXDocument(GetResponseXml("", false, i, PageId));

                if (i == 0)
                {
                    XmlResponse = ToXDocument(GetResponseXml("", true, i, PageId));

                }
                else
                {
                    XmlResponse = MergeXml(XmlResponse, CurrentPageXml, i);
                }
            }

            return XmlResponse.ToString();
        }

        //public IEnumerable<XElement> GetFormFields(int NumberOfPages, XDocument pMetaData)
        //    {
        //    IEnumerable<XElement> FieldList;
        //    for (int i = 0; NumberOfPages > i - 1; i++)
        //        {
        //        var  List = from _FieldTypeID in
        //                                              pMetaData.Descendants("Field")
        //                                          where _FieldTypeID.Attribute("Position").Value == (i - 1).ToString()
        //                                          select _FieldTypeID;

        //        }
        //    return FieldList;

        //    }

        public XDocument ToXDocument(XmlDocument xmlDocument)
        {
            using (var nodeReader = new XmlNodeReader(xmlDocument))
            {
                nodeReader.MoveToContent();
                return XDocument.Load(nodeReader);
            }
        }
        public XDocument MergeXml(XDocument SavedXml, XDocument CurrentPageResponseXml, int Pagenumber)
        {
            XDocument xdoc = XDocument.Parse(SavedXml.ToString());
            XElement oldXElement = xdoc.XPathSelectElement("SurveyResponse/Page[@PageNumber = '" + Pagenumber.ToString() + "']");

            if (oldXElement == null)
            {
                SavedXml.Root.Add(CurrentPageResponseXml.Elements());
                return SavedXml;
            }

            else
            {
                oldXElement.Remove();
                xdoc.Root.Add(CurrentPageResponseXml.Elements());
                return xdoc;
            }
        }
        public XmlDocument GetResponseXml(string SurveyId, bool AddRoot, int CurrentPage, string Pageid)
        {
            XmlDocument xml = new XmlDocument();
            XmlElement root = xml.CreateElement("SurveyResponse");

            if (CurrentPage == 0)
            {
                root.SetAttribute("SurveyId", SurveyId);
                root.SetAttribute("LastPageVisited", "1");
                root.SetAttribute("HiddenFieldsList", "");
                root.SetAttribute("HighlightedFieldsList", "");
                root.SetAttribute("DisabledFieldsList", "");
                root.SetAttribute("RequiredFieldsList", "");

                xml.AppendChild(root);
            }

            XmlElement PageRoot = xml.CreateElement("Page");
            if (CurrentPage != 0)
            {
                PageRoot.SetAttribute("PageNumber", CurrentPage.ToString());
                PageRoot.SetAttribute("PageId", Pageid);//Added PageId Attribute to the page node
                PageRoot.SetAttribute("MetaDataPageId", Pageid.ToString());
                xml.AppendChild(PageRoot);
            }

            foreach (var Field in this.PageFields)
            {
                XmlElement child = xml.CreateElement(Epi.Web.MVC.Constants.Constant.RESPONSE_DETAILS);
                child.SetAttribute("QuestionName", Field.Attribute("Name").Value);
                child.InnerText = Field.Value;
                PageRoot.AppendChild(child);
                //Start Adding required controls to the list
                SetRequiredList(Field);
            }

            return xml;
        }
        public FormResponseDetail GetResponse(string SurveyId, bool AddRoot, int CurrentPage, int PageId)
        {
            var formResponseDetail = new FormResponseDetail();
            if (CurrentPage == 0)
            {
                formResponseDetail.FormId = SurveyId;
                formResponseDetail.LastPageVisited = 1;
            }

            var pageResponseDetail = new PageResponseDetail();
            formResponseDetail.PageResponseDetailList.Add(pageResponseDetail);

            if (CurrentPage != 0)
            {
                pageResponseDetail.PageNumber = CurrentPage;
                pageResponseDetail.PageId = PageId;
                pageResponseDetail.MetadataPageId = PageId;
            }

            foreach (var Field in this.PageFields)
            {
                pageResponseDetail.ResponseQA.Add(Field.Attribute("Name").Value, Field.Value);
                //Start Adding required controls to the list
                SetRequiredList(Field);
            }

            return formResponseDetail;
        }

        public void SetRequiredList(XElement _Fields)
        {
            bool isRequired = false;
            string value = _Fields.Attribute("IsRequired").Value;

            if (bool.TryParse(value, out isRequired))
            {
                if (isRequired)
                {
                    if (!this.RequiredList.Contains(_Fields.Attribute("Name").Value))
                    {
                        if (this.RequiredList != "")
                        {
                            this.RequiredList = this.RequiredList + "," + _Fields.Attribute("Name").Value.ToLower();
                        }
                        else
                        {
                            this.RequiredList = _Fields.Attribute("Name").Value.ToLower();
                        }
                    }
                }
            }
        }

        public Epi.Web.MVC.Models.ResponseModel ConvertResponseDetailToModel(Epi.Web.Enter.Common.DTO.SurveyAnswerDTO item, List<KeyValuePair<int, string>> Columns)
        {
            Epi.Web.MVC.Models.ResponseModel ResponseModel = new Models.ResponseModel();


            var MetaDataColumns = Epi.Web.MVC.Constants.Constant.MetaDaTaColumnNames();

            try
            {
                ResponseModel.Column0 = item.ResponseId;
                ResponseModel.IsLocked = item.IsLocked;

                var responseQA = item.ResponseDetail.FlattenedResponseQA(key => key.ToLower());
                string value;
                var columnsCount = Columns.Count;
                for (int i = 0; i < 5; ++i)
                {
                    if (i >= columnsCount)
                    {
                        // set value to empty string for unspecified columns
                        value = string.Empty;
                    }
                    else if (MetaDataColumns.Contains(Columns[i].Value))
                    {
                        // set value to value of special column
                        value = GetColumnValue(item, Columns[i].Value);
                    }
                    else
                    {
                        // set value to value in the response
                        value = responseQA.TryGetValue(Columns[i].Value.ToLower(), out value) ? (value ?? string.Empty) : string.Empty;
                    }

                    // set the associated ResponseModel column
                    switch (i)
                    {
                        case 0:
                            ResponseModel.Column1 = value;
                            break;
                        case 1:
                            ResponseModel.Column2 = value;
                            break;
                        case 2:
                            ResponseModel.Column3 = value;
                            break;
                        case 3:
                            ResponseModel.Column4 = value;
                            break;
                        case 4:
                            ResponseModel.Column5 = value;
                            break;
                    }
                }

                return ResponseModel;
            }
            catch (Exception Ex)
            {

                throw new Exception(Ex.Message);
            }
        }
        private string GetColumnValue(Epi.Web.Enter.Common.DTO.SurveyAnswerDTO item, string columnName)
        {
            string ColumnValue = "";
            switch (columnName)
            {
                case "_UserEmail":
                    ColumnValue = item.UserEmail;
                    break;
                case "_DateUpdated":
                    ColumnValue = item.DateUpdated.ToString();
                    break;
                case "_DateCreated":
                    ColumnValue = item.DateCreated.ToString();
                    break;
                case "IsDraftMode":
                case "_Mode":
                    if (item.IsDraftMode.ToString().ToUpper() == "TRUE")
                    {
                        ColumnValue = "Staging";
                    }
                    else
                    {
                        ColumnValue = "Production";

                    }
                    break;
            }
            return ColumnValue;
        }
    }
}

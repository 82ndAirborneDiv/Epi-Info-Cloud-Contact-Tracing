﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Epi.Cloud.Common.Metadata;
using Epi.DataPersistence.DataStructures;
using Epi.FormMetadata.DataStructures.Interfaces;
using Epi.Cloud.Common.DTO;
using MvcDynamicForms.Fields;
using MvcDynamicForms.Utilities;

namespace MvcDynamicForms
{
	/// <summary>
	/// Represents an html input form that can be dynamically rendered at runtime.
	/// </summary>
	[Serializable]
    [ModelBinder(typeof(DynamicFormModelBinder))]
    public class Form
    {
        public Form()
        {
            Fields = new FieldList(this);
        }

        public double Width { get; set; }
        public double Height { get; set; }
        public bool IsMobile { get; set; }
        public string FormValuesHasChanged { get; set; }

        /// <summary>
        /// The html element that wraps all rendered html.
        /// </summary>
        public string FormWrapper { get; set; } = "div";

        /// <summary>
        /// The class attribute of the FormWrapper element that wraps all rendered html.
        /// </summary>
        public string FormWrapperClass { get; set; } = "MvcDynamicForm";

        /// <summary>
        /// Gets or sets the string that is used to prefix html input elements' id and name attributes.
        /// </summary>
        public string FieldPrefix
        {
            get { return _fieldPrefix.ToLower(); }
            set { _fieldPrefix = value; }
        }
        private string _fieldPrefix = "MvcDynamicField_";

        /// <summary>
        /// A collection of Field objects.
        /// </summary>
        public FieldList Fields { get; private set; }

        public MetadataAccessor MetadataAccessor { get { return SurveyInfo; } }

        /// <summary>
        /// Gets or sets the boolean value determining if the form should serialize itself into the string returned by the RenderHtml() method.
        /// </summary>
        public bool Serialize { get; set; }

        /// <summary>
        /// Returns an enumeration of Field objects that are of type InputField.
        /// </summary>
        public IEnumerable<InputField> InputFields
        {
            get
            {
                return Fields.OfType<InputField>();
            }
        }

        /// <summary>
        /// Validates each InputField object contained in the Fields collection. Validation also causes the Error property to be set for each InputField object.
        /// </summary>
        /// <returns>Returns true if every InputField object is valid. False is returned otherwise.</returns>
        public bool Validate(string RequiredFieldsList = "")
        {
            bool isValid = true;

            foreach (var field in InputFields)
            {
                if (!string.IsNullOrEmpty(RequiredFieldsList))
                {
                    var RequiredList = RequiredFieldsList.Split(',');
                    bool isRequired = false;
                    foreach (var item in RequiredList)
                    {
                        if (item == field.Key.ToString())
                        {
                            isRequired = true;
                            break;
                        }
                    }

                    if (isRequired)
                    {
                        field.Required = true;
                    }
                    else
                    {
                        field.Required = false;
                    }
                }
                else
                {
                    field.Required = false;
                }
                if (!field.Validate())
                {
                    isValid = false;
                }
            }
            return isValid;
        }



        /// <summary>
        /// Returns a string containing the rendered html of every contained Field object. The html can optionally include the Form object's state serialized into a hidden field.
        /// </summary>        
        /// <param name="formatHtml">Determines whether to format the generated html with indentation and whitespace for readability.</param>
        /// <returns>Returns a string containing the rendered html of every contained Field object.</returns>
        public string RenderHtml(bool formatHtml)
        {
            var formWrapper = new TagBuilder(FormWrapper);
            if (IsMobile)
            {
                formWrapper.Attributes.Add("style", "width:auto;height:auto;");
                formWrapper.Attributes.Add("data-role", "fieldcontain");
                formWrapper.Attributes.Add("data-ajax", "false");
            }
            else
            {
                formWrapper.Attributes.Add("style", string.Format("width:{0}px;height:{1}px;", this.Width, this.Height + 100));
            }
            formWrapper.Attributes["class"] = FormWrapperClass;
            var html = new StringBuilder(formWrapper.ToString(TagRenderMode.StartTag));

            foreach (var field in Fields.OrderBy(x => x.DisplayOrder))
                html.Append(field.RenderHtml());

            if (Serialize)
            {
                var hdn = new TagBuilder("input");
                hdn.Attributes["type"] = "hidden";
                hdn.Attributes["id"] = MagicStrings.MvcDynamicSerializedForm;
                hdn.Attributes["name"] = MagicStrings.MvcDynamicSerializedForm;
                hdn.Attributes["value"] = SerializationUtility.Serialize(this);
                html.Append(hdn.ToString(TagRenderMode.SelfClosing));
            }

            html.Append(formWrapper.ToString(TagRenderMode.EndTag));

            return html.ToString();

            /*
            if (formatHtml)
            {
                try
                {
                    var xml = XDocument.Parse(html.ToString());
                    return xml.ToString();
                }
                catch (Exception ex)
                {
                    return html.ToString();
                }
            }

            return html.ToString();*/
        }

        /// <summary>
        /// Returns a string containing the rendered html of every contained Field object. The html can optionally include the Form object's state serialized into a hidden field.
        /// </summary>
        /// <returns>Returns a string containing the rendered html of every contained Field object.</returns>
        public string RenderHtml()
        {
            return RenderHtml(false);
        }

        /// <summary>
        /// This method clears the Error property of each contained InputField.
        /// </summary>
        public void ClearAllErrors()
        {
            foreach (var inputField in InputFields)
                inputField.ClearError();
        }

        /// <summary>
        /// This method provides a convenient way of adding multiple Field objects at once.
        /// </summary>
        /// <param name="fields">Field object(s)</param>
        public void AddFields(params Fields.Field[] fields)
        {
            foreach (var field in fields)
            {
                Fields.Add(field);
                /*
                if(field is InputField)
                {

                    InputField inputField = field as InputField;
                    if (_fields.FieldIndex.ContainsKey(inputField.Key))
                    {
                        _fields[_fields.FieldIndex[inputField.Key]] = field;
                    }
                    else
                    {
                        _fields.Add(field);
                        _fields.FieldIndex.Add(inputField.Key, _fields.Count - 1);
                    }
                }
                else
                {
                    _fields.Add(field);
                }*/
            }
        }

        /// <summary>
        /// Provides a convenient way the end users' responses to each InputField
        /// </summary>
        /// <param name="completedOnly">Determines whether to return a Response object for only InputFields that the end user completed.</param>
        /// <returns>List of Response objects.</returns>
        public List<Response> GetResponses(bool completedOnly)
        {
            var responses = new List<Response>();
            foreach (var field in InputFields.OrderBy(x => x.DisplayOrder))
            {
                var response = new Response
                {
                    Title = field.Title,
                    Value = field.Response
                };

                if (completedOnly && string.IsNullOrEmpty(response.Value))
                    continue;

                responses.Add(response);
            }

            return responses;
        }

        /// <summary>
        ///  
        /// </summary>
        /// <param name="completedOnly"> </param>
        /// <returns>List of Response objects.</returns>
        public string GetErrorSummary()
        {
            List<ErrorSummary> ErrorSummary = new List<ErrorSummary>();

            foreach (var field in InputFields.OrderBy(x => x.DisplayOrder))
            {
                var Error = new ErrorSummary
                {
                    ErrorCode = field.ErrorClass,
                    ErrorValue = field.Error,
                    FieldName = field.Prompt
                };

                if (string.IsNullOrEmpty(Error.ErrorValue))
                    continue;

                ErrorSummary.Add(Error);
            }

            if (ErrorSummary.Count > 0)
            {
                return GetErrorSummaryList(ErrorSummary);
            }
            else
            {
                return string.Empty;
            }
        }

        public string GetErrorSummaryList(List<ErrorSummary> ErrorSummary)
        {
            StringBuilder ErrorList = new StringBuilder();
            ErrorList.Append("<Ul>");
            foreach (var Error in ErrorSummary)
            {
                ErrorList.AppendFormat("<li><B>{0}:</B> {1}</li>", Error.FieldName, Error.ErrorValue);
            }
            ErrorList.Append("</Ul>");

            return ErrorList.ToString();
        }

        public SurveyInfoDTO SurveyInfo { get; set; }
        public string PageId { get; set; } = string.Empty;
        public int NumberOfPages { get; set; }
        public int CurrentPage { get; set; }

        /// <summary>
        /// IsSaved is a boolean used to find whether the Save button has been clicked. It hs captured as a hidden variable in Survey/Index.cshtml. Based on the value
        /// we display the modal dialg to send email for survey 
        /// </summary>
        public bool IsSaved { get; set; }

        /// <summary>
        /// Response Id is saved with the form object to facilitate generating url that can be sent by e-mail or copy text, so a user can retrieve the unfinished survey
        /// </summary>
        public string ResponseId { get; set; }
        public string FormName { get; set; }
        public string FormId { get; set; }

        public string ParentResponseId { get; set; }
        public string ParentFormName { get; set; }
        public string ParentFormId { get; set; }

        public string RootResponseId { get; set; }
        public string RootFormName { get; set; }
        public string RootFormId { get; set; }


        public string FormJavaScript { get; set; }
        public string IsDraftModeStyleClass { get; set; } = string.Empty;
        public bool IsAndroid { get; set; }

        public int StatusId { get; set; }
        // To return to survey after exit
        public string PassCode { get; set; }
        public string HiddenFieldsList { get; set; }
        public string HighlightedFieldsList { get; set; }
        public string DisabledFieldsList { get; set; }
        public string AssignList { get; set; }
        public string RequiredFieldsList { get; set; }

        public Epi.Core.EnterInterpreter.Rule_Context FormCheckCodeObj { get; set; }

        public Epi.Core.EnterInterpreter.Rule_Context GetCheckCodeObj(IEnumerable<IAbridgedFieldInfo> fields, FormResponseDetail formResponseDetail, string formCheckCode)
        {
            Epi.Core.EnterInterpreter.EpiInterpreterParser EIP = new Epi.Core.EnterInterpreter.EpiInterpreterParser(Epi.Core.EnterInterpreter.EpiInterpreterParser.GetEnterCompiledGrammarTable());
            Epi.Core.EnterInterpreter.Rule_Context result = (Epi.Core.EnterInterpreter.Rule_Context)EIP.Context;
            result.LoadTemplate(fields, formResponseDetail.FlattenedResponseQA());
            EIP.Execute(formCheckCode);

            return result;
        }

        public Epi.Core.EnterInterpreter.Rule_Context GetRelateCheckCodeObj(List<RelatedFormsInfoDTO> Obj, string formCheckCode)
        {
            Epi.Core.EnterInterpreter.EpiInterpreterParser EIP = new Epi.Core.EnterInterpreter.EpiInterpreterParser(Epi.Core.EnterInterpreter.EpiInterpreterParser.GetEnterCompiledGrammarTable());
            Epi.Core.EnterInterpreter.Rule_Context result = (Epi.Core.EnterInterpreter.Rule_Context)EIP.Context;
            foreach (var item in Obj)
            {
                result.LoadTemplate(item.FieldDigests, item.ResponseDetail.FlattenedResponseQA());
            }
            EIP.Execute(formCheckCode);

            return result;
        }
    }
}

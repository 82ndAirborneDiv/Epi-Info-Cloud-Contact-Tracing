﻿using System;
using System.Text;
using System.Web.Mvc;
using Epi.Cloud.Common.Metadata;
using Epi.Core.EnterInterpreter;
namespace MvcDynamicForms.Fields
{
    [Serializable]
    public class RelateButton : InputField
    {
        new private string _promptClass = "MvcDynamicCommandButtonPrompt";
        public string RelatedViewId;       
        public RelateButton()
        {

        }
        public RelateButton(FieldAttributes fieldAttributes, double formWidth, double formHeight)
        {
            InitializeFromMetadata(fieldAttributes, formWidth, formHeight);
        }

        protected override void InitializeFromMetadata(FieldAttributes fieldAttributes, double formWidth, double formHeight)
        {
            base.InitializeFromMetadata(fieldAttributes, formWidth, formHeight);
            Title = fieldAttributes.FieldName;
            Prompt = fieldAttributes.PromptText;
            DisplayOrder = fieldAttributes.TabIndex;
            // Required = _FieldTypeID.Attribute("IsRequired").Value == "True" ? true : false,
            //RequiredMessage = _FieldTypeID.Attribute("PromptText").Value + " is required",
            RequiredMessage = "This field is required";
            Key = fieldAttributes.FieldName;
            PromptTop = formHeight * fieldAttributes.PromptTopPositionPercentage;
            PromptLeft = formWidth * fieldAttributes.PromptLeftPositionPercentage;
            Top = formHeight * fieldAttributes.ControlTopPositionPercentage;
            Left = formWidth * fieldAttributes.ControlLeftPositionPercentage;
            PromptWidth = formWidth * fieldAttributes.ControlWidthPercentage;
            ControlWidth = formWidth * fieldAttributes.ControlWidthPercentage;          


            fontstyle = fieldAttributes.ControlFontStyle;
            fontSize = fieldAttributes.ControlFontSize;
            fontfamily = fieldAttributes.ControlFontFamily;
            // IsRequired = Helpers.GetRequiredControlState(form.RequiredFieldsList.ToString(), _FieldTypeID.Attribute("Name").Value, "RequiredFieldsList"),
            //Required = Helpers.GetRequiredControlState(form.RequiredFieldsList.ToString(), _FieldTypeID.Attribute("Name").Value, "RequiredFieldsList"),
            InputFieldfontstyle = fieldAttributes.ControlFontStyle;
            InputFieldfontSize = fieldAttributes.ControlFontSize;
            InputFieldfontfamily = fieldAttributes.ControlFontFamily;
            IsReadOnly = fieldAttributes.IsReadOnly;
            RelatedViewId = fieldAttributes.RelatedViewId;
            //  Value = _ControlValue,
            //IsHidden = Helpers.GetControlState(SurveyAnswer, _FieldTypeID.Attribute("Name").Value, "HiddenFieldsList"),
            // IsHighlighted = Helpers.GetControlState(SurveyAnswer, _FieldTypeID.Attribute("Name").Value, "HighlightedFieldsList"),
            // IsDisabled = Helpers.GetControlState(SurveyAnswer, _FieldTypeID.Attribute("Name").Value, "DisabledFieldsList"),               

        }

        public override string RenderHtml()
        {
            string name = "mvcdynamicfield_" + _key;
            var html = new StringBuilder();
            string ErrorStyle = string.Empty;

            var commandButtonTag = new TagBuilder("button");

            //commandButtonTag.Attributes.Add("text", Prompt);

            // prompt label
            var prompt = new TagBuilder("label");
           // var inputName = _form.FieldPrefix + _key;
            prompt.SetInnerText(Prompt);

            StringBuilder StyleValues = new StringBuilder();
            StyleValues.Append(GetStyle(_fontstyle.ToString()));

            double PromptSize = Prompt.Length * fontSize;

            if (PromptSize > this.ControlWidth)
            {
                prompt.Attributes.Add("style", StyleValues.ToString() + ";width:" + _controlWidth.ToString() + "px");
            }
            else
            {
                prompt.Attributes.Add("style", StyleValues.ToString());

            }        
            commandButtonTag.InnerHtml = prompt.ToString();
        
            commandButtonTag.Attributes.Add("id", name);
            commandButtonTag.Attributes.Add("name", "Relate");
            //commandButtonTag.Attributes.Add("name", name);
            commandButtonTag.Attributes.Add("type", "button");

            commandButtonTag.Attributes.Add("onclick", "NavigateToChild(" + RelatedViewId + ");");
            string IsHiddenStyle = "";
            string IsHighlightedStyle = "";

            if (_IsHidden)
            {
                IsHiddenStyle = "display:none";
            }

            if (_IsHighlighted)
            {
                IsHighlightedStyle = "background-color:yellow";
            }

            if (_IsDisabled)
            {
                commandButtonTag.Attributes.Add("disabled", "disabled");
            }

            // commandButtonTag.Attributes.Add("style", "position:absolute;left:" + _left.ToString() + "px;top:" + _top.ToString() + "px" + ";width:" + _Width.ToString() + "px" + ";height:" + _Height.ToString() + "px" + ErrorStyle + ";" + IsHiddenStyle + ";" + IsHighlightedStyle);
            commandButtonTag.Attributes.Add("style", "position:absolute;left:" + _left.ToString() + "px;top:" + _top.ToString() + "px" + ";width:" + ControlWidth.ToString() + "px" + ";height:" + ControlHeight.ToString() + "px" + ErrorStyle + ";" + IsHiddenStyle + ";" + IsHighlightedStyle);
            EnterRule FunctionObjectAfter = (EnterRule)_form.FormCheckCodeObj.GetCommand("level=field&event=after&identifier=" + _key);
            if (FunctionObjectAfter != null && !FunctionObjectAfter.IsNull())
            {
                commandButtonTag.Attributes.Add("onblur", "return " + _key + "_after();"); //After
            }
            EnterRule FunctionObjectBefore = (EnterRule)_form.FormCheckCodeObj.GetCommand("level=field&event=before&identifier=" + _key);
            if (FunctionObjectBefore != null && !FunctionObjectBefore.IsNull())
            {
                commandButtonTag.Attributes.Add("onfocus", "return " + _key + "_before();"); //Before
            }
            EnterRule FunctionObjectClick = (EnterRule)_form.FormCheckCodeObj.GetCommand("level=field&event=click&identifier=" + _key);
            if (FunctionObjectClick != null && !FunctionObjectClick.IsNull())
            {
                commandButtonTag.Attributes.Add("onclick", "return " + _key + "_click();");
            }

            //   html.Append(commandButtonTag.ToString(TagRenderMode.SelfClosing));
            html.Append(commandButtonTag.ToString());
            var scriptBuilder = new TagBuilder("script");
            scriptBuilder.InnerHtml = "$('#" + name + "').BlockEnter('" + name + "');";
            scriptBuilder.ToString(TagRenderMode.Normal);
            html.Append(scriptBuilder.ToString(TagRenderMode.Normal));

            var wrapper = new TagBuilder(_fieldWrapper);
            wrapper.Attributes["class"] = _fieldWrapperClass;
            if (_IsHidden)
            {
                wrapper.Attributes["style"] = "display:none";

            }
            wrapper.Attributes["id"] = name + "_fieldWrapper";
            wrapper.InnerHtml = html.ToString();
            return wrapper.ToString();
        }

        public string GetStyle(string ControlFontStyle)
        {

            StringBuilder FontStyle = new StringBuilder();
            StringBuilder FontWeight = new StringBuilder();
            StringBuilder TextDecoration = new StringBuilder();
            StringBuilder CssStyles = new StringBuilder();

            char[] delimiterChars = { ' ', ',' };
            string[] Styles = ControlFontStyle.Split(delimiterChars);

            foreach (string Style in Styles)
            {
                switch (Style.ToString())
                {
                    case "Italic":
                        FontStyle.Append(Style.ToString());
                        break;
                    case "Oblique":
                        FontStyle.Append(Style.ToString());

                        break;

                }

            }
            foreach (string Style in Styles)
            {
                switch (Style.ToString())
                {
                    case "Bold":
                        FontWeight.Append(Style.ToString());
                        break;
                    case "Normal":
                        FontWeight.Append(Style.ToString());

                        break;

                }

            }
            CssStyles.Append("font:");//1
            if (!string.IsNullOrEmpty(FontStyle.ToString()))
            {

                CssStyles.Append(FontStyle);//2
                CssStyles.Append(" ");//3
            }
            CssStyles.Append(FontWeight);
            CssStyles.Append(" ");
            CssStyles.Append(_fontSize.ToString() + "pt ");
            CssStyles.Append(" ");
            CssStyles.Append(_fontfamily.ToString());

            foreach (string Style in Styles)
            {
                switch (Style.ToString())
                {
                    case "Strikeout":
                        TextDecoration.Append("line-through");
                        break;
                    case "Underline":
                        TextDecoration.Append(Style.ToString());

                        break;

                }

            }

            if (!string.IsNullOrEmpty(TextDecoration.ToString()))
            {
                CssStyles.Append(";text-decoration:");
            }

            CssStyles.Append(TextDecoration);


            return CssStyles.ToString();

        }

        public override bool Validate()
        {
            ClearError();
            return true;
        }
        public override string Response
        {
            get { return Value; }
            set { Value = value; }
        }
    }
}

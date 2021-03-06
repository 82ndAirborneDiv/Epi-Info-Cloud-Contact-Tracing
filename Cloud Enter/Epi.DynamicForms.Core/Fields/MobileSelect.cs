﻿using System;
using System.Text;
using System.Web.Mvc;
using Epi.Core.EnterInterpreter;
using System.Drawing;
using Epi.Cloud.Common.Metadata;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Linq;

namespace MvcDynamicForms.Fields
{
    /// <summary>
    /// Represents an html select element.
    /// </summary>
    [Serializable]
    public class MobileSelect : ListField
    {

        public MobileSelect()
        {
        }

        public Dictionary<string, List<string>> CodesList { get; set; }

        public MobileSelect(FieldAttributes fieldAttributes, double formWidth, double formHeight)// string DropDownValues, int FieldTypeId)
        {
            InitializeFromMetadata(fieldAttributes, formWidth, formHeight);//, DropDownValues, FieldTypeId);
        }

        protected override void InitializeFromMetadata(FieldAttributes fieldAttributes, double formWidth, double formHeight)
        {
            base.InitializeFromMetadata(fieldAttributes, formWidth, formHeight);

            Title = fieldAttributes.FieldName;
            Prompt = fieldAttributes.PromptText;
            Key = fieldAttributes.FieldName;
            PromptTop = formHeight * fieldAttributes.PromptTopPositionPercentage;
            PromptLeft = formWidth * fieldAttributes.PromptLeftPositionPercentage;
            PromptWidth = formWidth * fieldAttributes.ControlWidthPercentage;
            ControlWidth = formWidth * fieldAttributes.ControlWidthPercentage;
            ControlHeight = formHeight * fieldAttributes.ControlHeightPercentage;

            InputFieldfontstyle = fieldAttributes.ControlFontStyle;
            InputFieldfontfamily = fieldAttributes.ControlFontFamily;
            InputFieldfontSize = fieldAttributes.ControlFontSize;

            IsRequired = fieldAttributes.IsRequired;
            Required = fieldAttributes.Required;
            RequiredMessage = fieldAttributes.RequiredMessage;
            ReadOnly = fieldAttributes.IsReadOnly;
        }
        /// <summary>
        /// The number of options to display at a time.
        /// </summary>
        public int Size
        {
            get
            {
                string size;
                return _inputHtmlAttributes.TryGetValue("size", out size) ? int.Parse(size) : 1;
            }
            set { _inputHtmlAttributes["size"] = value.ToString(); }
        }
        /// <summary>
        /// Determines whether the select element will accept multiple selections.
        /// </summary>
        public bool MultipleSelection
        {
            get
            {
                string multiple;
                if (_inputHtmlAttributes.TryGetValue("multiple", out multiple))
                {
                    return multiple.ToLower() == "multiple";
                }
                return false;
            }
            set { _inputHtmlAttributes["multiple"] = value.ToString(); }
        }

        //public int SelectType { get; set; }
        /// <summary>
        /// The text to be rendered as the first option in the select list when ShowEmptyOption is set to true.
        /// </summary>
        /// 
        public string EmptyOption { get; set; }
        /// <summary>
        /// Determines whether a valueless option is rendered as the first option in the list.
        /// </summary>
        public bool ShowEmptyOption { get; set; }

        public override string RenderHtml()
        {
            var html = new StringBuilder();

            var inputName = _form.FieldPrefix + _key;
            string ErrorStyle = string.Empty;




            //var Div = new TagBuilder("div");
            //Div.Attributes.Add("data-role", "fieldcontain");
            //html.Append(Div.ToString(TagRenderMode.StartTag));


            // prompt
            var prompt = new TagBuilder("label");

            System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(@"(\r\n|\r|\n)+");

            string newText = regex.Replace(Prompt.Replace("  ", "&nbsp;"), "<br />");

            string NewPromp = System.Web.Mvc.MvcHtmlString.Create(newText).ToString();


            prompt.InnerHtml = NewPromp;
            prompt.Attributes.Add("for", inputName);
            prompt.Attributes.Add("class", "select");
            prompt.Attributes.Add("Id", "label" + inputName);


            StringBuilder StyleValues = new StringBuilder();
            //StyleValues.Append(GetControlStyle(_fontstyle.ToString(), _promptTop.ToString(), _promptLeft.ToString(), null, Height.ToString(), _IsHidden));
            //prompt.Attributes.Add("style", StyleValues.ToString());
            //StyleValues.Append(GetContolStyle(_fontstyle.ToString(), _Prompttop.ToString(), _Promptleft.ToString(), null, Height.ToString(), _IsHidden));
            //StyleValues.Append(GetContolStyle(_fontstyle.ToString(), null, null, null, null, _IsHidden));
            // prompt.Attributes.Add("style", StyleValues.ToString());
            prompt.Attributes.Add("style", "display:block !important; ");
            html.Append(prompt.ToString());

            var OuterDiv = new TagBuilder("div");
            if (this.IsAndroidfield)
            {

                OuterDiv.Attributes.Add("class", "mainselection");
                OuterDiv.SetInnerText("");
                html.Append(OuterDiv.ToString(TagRenderMode.StartTag));
            }
            if (this.IsAndroidfield)
            {
                var Div = new TagBuilder("div");
                Div.Attributes.Add("class", "arrow_icon");
                Div.SetInnerText("");
                html.Append(Div.ToString());
            }
            // error label
            if (!IsValid)
            {
                //Add new Error to the error Obj

                ErrorStyle = ";border-color: red";

            }

            // open select element
            var select = new TagBuilder("select");
            select.Attributes.Add("id", inputName);
            select.Attributes.Add("name", inputName);
            if (this.IsAndroidfield)
            {
                select.Attributes.Add("data-role", "none");
                select.Attributes.Add("data-native-menu", "false");
            }
            string InputFieldStyle = GetInputFieldStyle(_InputFieldfontstyle.ToString(), _InputFieldfontSize, _InputFieldfontfamily.ToString());
            //select.Attributes.Add("data-mini", "true");
            ////////////Check code start//////////////////
            EnterRule FunctionObjectAfter = (EnterRule)_form.FormCheckCodeObj.GetCommand("level=field&event=after&identifier=" + _key);
            if (FunctionObjectAfter != null && !FunctionObjectAfter.IsNull())
            {

                select.Attributes.Add("onchange", "return " + _key + "_after(this.id);"); //After
            }
            EnterRule FunctionObjectBefore = (EnterRule)_form.FormCheckCodeObj.GetCommand("level=field&event=before&identifier=" + _key);
            if (FunctionObjectBefore != null && !FunctionObjectBefore.IsNull())
            {

                select.Attributes.Add("onfocus", "return " + _key + "_before(this.id);"); //Before
            }

            EnterRule FunctionObjectClick = (EnterRule)_form.FormCheckCodeObj.GetCommand("level=field&event=click&identifier=" + _key);
            if (FunctionObjectClick != null && !FunctionObjectClick.IsNull())
            {
                select.Attributes.Add("onclick", "return " + _key + "_click(this.id);"); //click
            }

            ////////////Check code end//////////////////
            int LargestChoiseLength = 0;
            string measureString = "";
            foreach (var choise in _choices)
            {

                if (choise.Key.ToString().Length > LargestChoiseLength)
                {
                    LargestChoiseLength = choise.Key.ToString().Length;

                    measureString = choise.Key.ToString();
                }


            }

            // LargestChoiseLength = LargestChoiseLength * _ControlFontSize;

            Font stringFont = new Font(ControlFontStyle, (float)_ControlFontSize);

            SizeF size = new SizeF();
            using (Graphics g = Graphics.FromHwnd(IntPtr.Zero))
            {
                size = g.MeasureString(measureString.ToString(), stringFont);
            }



            // stringSize = (int) Graphics.MeasureString(measureString.ToString(), stringFont).Width;


            if (_isRequired == true)
            {
                if ((size.Width) > _controlWidth)
                {
                    select.Attributes.Add("class", "validate[required] text-input fix-me");
                }
                else
                {
                    select.Attributes.Add("class", "validate[required] text-input");
                }
                select.Attributes.Add("data-prompt-position", "topLeft:10");
            }
            else
            {

                if ((size.Width) > _controlWidth)
                {
                    select.Attributes.Add("class", "fix-me");
                }

            }
            string IsHiddenStyle = "";
            string IsHighlightedStyle = "";
            //if (_IsHidden)
            //{
            //    IsHiddenStyle = "display:none";
            //}
            /* if (_IsHighlighted)
               {
               IsHighlightedStyle = "background-color:yellow";
              }*/

            //if (_IsDisabled)
            //{
            //    select.Attributes.Add("disabled", "disabled");
            //}
            //select.Attributes.Add("style", "position:absolute;left:" + _left.ToString() + "px;top:" + _top.ToString() + "px" + ";width:" + _ControlWidth.ToString() + "px ; font-size:" + _ControlFontSize + "pt;" + ErrorStyle + ";" + IsHiddenStyle + ";" + IsHighlightedStyle);
            select.Attributes.Add("style", "" + ErrorStyle + ";" + IsHiddenStyle + ";" + IsHighlightedStyle+ InputFieldStyle);
            select.MergeAttributes(_inputHtmlAttributes);
            html.Append(select.ToString(TagRenderMode.StartTag));
            // If readonly then add the following jquery script to make the field disabled 
            if (ReadOnly || _IsDisabled)
            {
                var scriptReadOnlyText = new TagBuilder("script");
                //scriptReadOnlyText.InnerHtml = "$(function(){$('#" + inputName + "').attr('disabled','disabled')});";
                scriptReadOnlyText.InnerHtml = "$(function(){  var List = new Array();List.push('" + _key + "');CCE_Disable(List, false);});";
                html.Append(scriptReadOnlyText.ToString(TagRenderMode.Normal));
            }

            // initial empty option
            if (ShowEmptyOption)
            {
                var opt = new TagBuilder("option");
                opt.Attributes.Add("value", null);
                opt.SetInnerText(EmptyOption);
                opt.Attributes.Add("style", "" + InputFieldStyle);
                html.Append(opt.ToString());
            }


            if (this.CodesList != null)
            {
                if (this.CodesList.Count() > 0)
                {
                    string Html = "";
                    var ScriptRelateCondition = new TagBuilder("script");
                    foreach (var code in CodesList)
                    {
                        Html = "";
                        Html = "var " + code.Key.ToString() + "=[";
                        var json1 = JsonConvert.SerializeObject(code.Value);
                        foreach (var item in code.Value)
                        {
                            var values = item.Split('=');
                            Html = Html + "\"" + values[0] + "," + values[1].ToString().Replace("\"", "") + "\",";


                        }
                        Html = Html + "]; ";
                        ScriptRelateCondition.InnerHtml = ScriptRelateCondition.InnerHtml + Html.ToString();

                    }
                    html.Append(ScriptRelateCondition.ToString(TagRenderMode.Normal));
                    //var JasonObj =
                    // var jsonSerialiser = new JavaScriptSerializer();
                    var json = JsonConvert.SerializeObject(CodesList);

                }
            }
            // options

            switch (this.SelectType.ToString())
            {
                case "11":
                    foreach (var choice in _choices)
                    {
                        var opt = new TagBuilder("option");
                        opt.Attributes.Add("style", "" + InputFieldStyle);
                        var optSelectedVale = "";
                        if (!string.IsNullOrEmpty(SelectedValue.ToString()))
                        {
                            optSelectedVale = SelectedValue.ToString();//=="1"? "Yes" : "No";
                        }
                        opt.Attributes.Add("value", (choice.Key == "Yes" ? "1" : "0"));
                        if (choice.Key == optSelectedVale.ToString())
                        {
                            opt.Attributes.Add("selected", "selected");

                        }
                        if (choice.Key == "Yes" || choice.Key == "No")
                        {
                            opt.SetInnerText(choice.Key);                          
                            html.Append(opt.ToString());
                        }

                    }
                    break;
                case "17":
                    foreach (var choice in _choices)
                    {
                        var opt = new TagBuilder("option");
                        opt.Attributes.Add("value", choice.Key);
                        if (choice.Key == SelectedValue.ToString()) opt.Attributes.Add("selected", "selected");
                        opt.SetInnerText(choice.Key);
                        opt.Attributes.Add("style", "" + InputFieldStyle);
                        html.Append(opt.ToString());
                    }

                    break;
                case "18":
                    foreach (var choice in _choices)
                    {
                        var opt = new TagBuilder("option");
                        opt.Attributes.Add("value", choice.Key);
                        if (choice.Key == SelectedValue.ToString()) opt.Attributes.Add("selected", "selected");
                        opt.SetInnerText(choice.Key);
                        opt.Attributes.Add("style", "" + InputFieldStyle);
                        html.Append(opt.ToString());
                    }

                    break;
                case "19":
                    foreach (var choice in _choices)
                    {
                        var opt = new TagBuilder("option");
                        if (choice.Key.Contains("-"))
                        {
                            opt.Attributes.Add("value", choice.Key.Remove(choice.Key.IndexOf("-")));

                            //if (choice.Key.Remove(choice.Key.IndexOf("-")) == SelectedValue.ToString()) opt.Attributes.Add("selected", "selected");
                            if (choice.Value || choice.Key.Remove(choice.Key.IndexOf("-")) == SelectedValue.ToString())
                            {
                                opt.Attributes.Add("selected", "selected");
                            }
                            opt.SetInnerText(choice.Key.Substring(choice.Key.IndexOf("-") + 1));
                        }
                        opt.Attributes.Add("style", "" + InputFieldStyle);
                        html.Append(opt.ToString());
                    }
                    break;
            }

            // close select element
            html.Append(select.ToString(TagRenderMode.EndTag));
            //html.Append(Div.ToString(TagRenderMode.EndTag));
            // add hidden tag, so that a value always gets sent for select tags

            if (this.IsAndroidfield)
            {

                html.Append(OuterDiv.ToString(TagRenderMode.EndTag));
            }
            var hidden = new TagBuilder("input");
            hidden.Attributes.Add("type", "hidden");
            hidden.Attributes.Add("id", inputName + "_hidden");
            hidden.Attributes.Add("name", inputName);
            hidden.Attributes.Add("value", string.Empty);
            html.Append(hidden.ToString(TagRenderMode.SelfClosing));



            var wrapper = new TagBuilder(_fieldWrapper);

            string AndroidClasses = "";
            if (this.IsAndroidfield)
            {
                AndroidClasses = " ui-field-contain   ";
            }


            if (!IsValid)
            {

                wrapper.Attributes["class"] = _fieldWrapperClass + " SelectNotValid" + AndroidClasses;
            }
            else
            {
                wrapper.Attributes["class"] = _fieldWrapperClass + AndroidClasses;

            }
            if (_IsHidden)
            {
                wrapper.Attributes["style"] = "display:none";

            }

            //wrapper.Attributes["style"] = GetStyle( _IsHidden,  _IsHighlighted);

            wrapper.Attributes["id"] = inputName + "_fieldWrapper";
            wrapper.InnerHtml = html.ToString();
            return wrapper.ToString();
        }
        public string GetStyle(bool _IsHidden, bool _IsHighlighted)
        {

            string Style = "";
            if (_IsHidden)
            {
                Style += " display:none";

            }
            if (_IsHighlighted)
            {
                Style += " background-color:yellow";
            }

            return Style;
        }

        public string GetControlStyle(string ControlFontStyle, string Top, string Left, string Width, string Height, bool IsHidden)
        {
            StringBuilder FontStyle = new StringBuilder();
            StringBuilder FontWeight = new StringBuilder();
            StringBuilder TextDecoration = new StringBuilder();
            StringBuilder CssStyles = new StringBuilder();

            char[] delimiterChars = { ' ', ',' };
            string[] Styles = ControlFontStyle.Split(delimiterChars);
            // CssStyles.Append("width: auto");

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

            CssStyles.Append(" font:");//1

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

            if (IsHidden)
            {
                CssStyles.Append(";display:none");
            }

            CssStyles.Append(TextDecoration);

            return CssStyles.ToString();
        }
    }
}

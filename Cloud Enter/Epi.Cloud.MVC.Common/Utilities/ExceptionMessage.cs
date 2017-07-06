﻿using System;
using System.Web;
using System.Configuration;
using Epi.Cloud.Common.Constants;

namespace Epi.Web.Utility
{
    public class ExceptionMessage
    {

        /// <summary>
        /// the following method takes email and responseUrl as argument and email redirection url to the user 
        /// </summary>
        /// <param name="emailAddress">email address for sending message (email is NOT saved)</param>
        /// <param name="redirectUrl">url for resuming the saved survey</param>
        /// <param name="surveyName">Name of the survey</param>
        /// <param name="passCode"> Code for accessing an unfinished survey </param>
        /// <returns></returns>
        public static bool SendMessage(string emailAddress, string redirectUrl, string surveyName, string passCode, string EmailSubject)
        {
            try
            {
                bool isAuthenticated = false;
                bool isUsingSSL = false;
                int SMTPPort = 25;

                // App Config Settings:
                // EMAIL_USE_AUTHENTICATION [ True | False ] default is False
                // EMAIL_USE_SSL [ True | False] default is False
                // SMTP_HOST [ url or ip address of smtp server ]
                // SMTP_PORT [ port number to use ] default is 25
                // EMAIL_FROM [ email address of sender and authenticator ]
                // EMAIL_PASSWORD [ password of sender and authenticator ]


                string s = ConfigurationManager.AppSettings["EMAIL_USE_AUTHENTICATION"];
                if (!String.IsNullOrEmpty(s))
                {
                    if (s.ToUpper() == "TRUE")
                    {
                        isAuthenticated = true;
                    }
                }

                s = ConfigurationManager.AppSettings["EMAIL_USE_SSL"];
                if (!String.IsNullOrEmpty(s))
                {
                    if (s.ToUpper() == "TRUE")
                    {
                        isUsingSSL = true;
                    }
                }

                s = ConfigurationManager.AppSettings["SMTP_PORT"];
                if (!int.TryParse(s, out SMTPPort))
                {
                    SMTPPort = 25;
                }

                System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                message.To.Add(emailAddress);
                message.Subject = EmailSubject;      // "Link for Survey: " + surveyName; 
                message.From = new System.Net.Mail.MailAddress(ConfigurationManager.AppSettings["EMAIL_FROM"].ToString());
                message.Body = redirectUrl + " and Pass Code is: " + passCode;
                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient(ConfigurationManager.AppSettings["SMTP_HOST"].ToString());
                smtp.Port = SMTPPort;

                if (isAuthenticated)
                {
                    smtp.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["EMAIL_FROM"].ToString(), ConfigurationManager.AppSettings["EMAIL_PASSWORD"].ToString());
                }


                smtp.EnableSsl = isUsingSSL;


                smtp.Send(message);

                return true;

            }
            catch (Exception ex)
            {
                return false;
            }
        }


        /// <summary>
        /// the following method sends email messages from loggin errors 
        /// </summary>
        /// <param name="emailAddress">email address for sending message (email is NOT saved)</param>
        /// <param name="pSubjectLine">subject text</param>
        /// <param name="pMessage">Message body text</param>
        /// <returns></returns>
        //public static bool SendLogMessage(string emailAddress, string pSubjectLine, Exception exc, HttpContextBase Context = null)
        public static bool SendLogMessage(Exception exc, HttpContextBase Context = null)
        {
            try
            {
                bool isAuthenticated = false;
                bool isUsingSSL = false;
                int SMTPPort = 25;
                string AdminEmailAddress = "";
                bool IsEmailNotification = false;
                // App Config Settings:
                // EMAIL_USE_AUTHENTICATION [ True | False ] default is False
                // EMAIL_USE_SSL [ True | False] default is False
                // SMTP_HOST [ url or ip address of smtp server ]
                // SMTP_PORT [ port number to use ] default is 25
                // EMAIL_FROM [ email address of sender and authenticator ]
                // EMAIL_PASSWORD [ password of sender and authenticator ]
                string pMessage;

                pMessage = "Exception Message:\n" + exc.Message + "\n\n\n";
                if (Context != null)
                {
                    pMessage += "Exception Timestamp:\n" + Context.Timestamp + "\n\n\n"
                        + "Request Path:\n " + (Context.Request).Path + "\n\n\n"
                        + "Request Method:\n" + (Context.Request).HttpMethod + "\n\n\n";
                }
                pMessage += "Inner Exception :\n" + exc.InnerException + ";" +
                            "Exception StackTrace:\n" + exc.StackTrace + "\n\n\n";

                if (Context != null && !string.IsNullOrEmpty(Context.Session[SessionKeys.UserFirstName].ToString()))
                {
                    pMessage += "Logged in User: \n" + Context.Session[SessionKeys.UserFirstName].ToString() + " " + Context.Session[SessionKeys.UserLastName].ToString() + "\n\n\n"; ;
                    pMessage += "Form Id: \n" + Context.Session[SessionKeys.RootFormId] + "\n\n\n"; ;
                    pMessage += "Response Id: \n" + Context.Session[SessionKeys.RootResponseId] + "\n\n\n"; ;
                }

                AdminEmailAddress = AppSettings.GetStringValue(AppSettings.Key.LoggingAdminEmailAddress);

                IsEmailNotification = AppSettings.GetBoolValue(AppSettings.Key.LoggingSendEmailNotification);

                isAuthenticated = AppSettings.GetBoolValue(AppSettings.Key.EmailUseAuthentication);

                isUsingSSL = AppSettings.GetBoolValue(AppSettings.Key.EmailUseSSL);

                SMTPPort = AppSettings.GetIntValue(AppSettings.Key.SmtpPort);

                System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
                //message.To.Add(emailAddress);
                message.To.Add(AdminEmailAddress);
                message.Subject = AppSettings.GetStringValue(AppSettings.Key.LoggingEmailSubject);
                message.From = new System.Net.Mail.MailAddress(AppSettings.GetStringValue(AppSettings.Key.EmailFrom));
                message.Body = pMessage;
                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient(ConfigurationManager.AppSettings[AppSettings.Key.SmtpHost].ToString());
                smtp.Port = SMTPPort;

                if (isAuthenticated)
                {
                    smtp.Credentials = new System.Net.NetworkCredential(AppSettings.GetStringValue(AppSettings.Key.EmailFrom), ConfigurationManager.AppSettings["EMAIL_PASSWORD"].ToString());
                }


                smtp.EnableSsl = isUsingSSL;

                if (IsEmailNotification)
                {
                    smtp.Send(message);
                    return true;
                }
                return false;

            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }


}
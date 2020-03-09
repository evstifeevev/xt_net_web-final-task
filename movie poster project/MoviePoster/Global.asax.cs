using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using MoviePoster.Logger;
using System.IO;
using log4net.Config;

namespace MoviePoster
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            var configFile = new FileInfo(AppDomain.CurrentDomain.BaseDirectory
                + "\\web.config");
            Logger.Logger.InitLogger(configFile);
            XmlConfigurator.Configure();
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception exception = Server.GetLastError();
            Response.Clear();
            Server.ClearError();

            HttpException httpException = exception as HttpException;
            if (httpException != null)
            {
                switch (httpException.GetHttpCode())
                {
                    case 404:
                        // page not found

                        break;
                    case 500:
                        // server error

                        break;
                    default:

                        break;
                }
            }
            Logger.Logger.LogFatal("Application error. " + " "
                + exception.ToString() + " " + exception.Message);
            Response.Redirect("~/Pages/ErrorPage.cshtml");
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}
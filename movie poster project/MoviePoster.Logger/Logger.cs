using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using log4net;
using log4net.Config;
using System.IO;

namespace MoviePoster.Logger
{
    public static class Logger
    {
        private static ILog log = LogManager.GetLogger("LOGGER");


        public static ILog Log
        {
            get { return log; }
        }

        public static void InitLogger(FileInfo logConfig)
        {

            XmlConfigurator.Configure(logConfig);
        }

        public static void LogError(string msg)
        {

            Log.Error(msg);
        }

        public static void LogFatal(string msg)
        {

            Log.Fatal(msg);
        }
    }
}

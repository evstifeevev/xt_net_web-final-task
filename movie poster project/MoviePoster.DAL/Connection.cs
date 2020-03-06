using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace MoviePoster.DAL
{
    public class Connection : IDisposable
    {
        public SqlConnection con = new SqlConnection(_connectionString);
        private static string _connectionString = "Data Source=DESKTOP-B9I0HE5\\SQLEXPRESS01;Initial Catalog=movie_poster;Integrated Security=True";

        public void Dispose()
        {
            con.Dispose();
        }
    }
}

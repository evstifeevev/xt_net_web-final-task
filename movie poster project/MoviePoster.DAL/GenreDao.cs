using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoviePoster.DAL.Interfaces;
using MoviePoster.Entities;
using System.Data.SqlClient;
using System.Data;
namespace MoviePoster.DAL
{
    class GenreDao : IGenreDao
    {
        public Genre Add(Genre genre)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_add_genre", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = genre.Title;

                    conn.con.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                        return genre;
                    else
                    {
                        // Handle exception.
                    }
                }
            }
            return null;
        }

        public void ChangeTitle(int genreId, string title)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_update_genre", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = genreId;
                    cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = title;

                    conn.con.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                        return;
                    else
                    {
                        // Handle exception.
                    }
                }
            }
        }

        #region NOT_IMPLEMENTED

        public IEnumerable<Genre> GetAll()
        {
            throw new NotImplementedException();
        }

        public Genre GetById(int id)
        {
            throw new NotImplementedException();
        }

        public void Remove(int id)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}

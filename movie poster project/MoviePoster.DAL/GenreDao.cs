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

        public IEnumerable<Genre> GetAll()
        {
            throw new NotImplementedException();
        }

        public Genre GetById(int id)
        {
            throw new NotImplementedException();
            //using (Connection conn = new Connection())
            //{
            //    using (SqlCommand cmd = new SqlCommand("mov_get_user_by_id", conn.con))
            //    {
            //        cmd.CommandType = CommandType.StoredProcedure;

            //        cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;

            //        conn.con.Open();

            //        var reader = cmd.ExecuteReader();

            //        while (reader.Read())
            //        {
            //            var user = new User(id: (int)reader["id"],
            //                login: reader["login"] as string,
            //                email: reader["email"] as string,
            //                password: reader["password"] as string,
            //                addressId: (int)reader["address_id"],
            //                profileId: (int)reader["profile_id"],
            //                status: reader["email"] as string,
            //                role: reader["email"] as string,
            //                createdAt: (DateTime)reader["created_at"],
            //                updatedAt: (DateTime)reader["updated_at"]
            //            );
            //            return user;
            //        }

            //    }
            //}
            //return null;
        }

        public void Remove(int id)
        {
            throw new NotImplementedException();
        }
    }
}

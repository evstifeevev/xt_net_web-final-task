using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoviePoster.DAL.Interfaces;
using MoviePoster.Entities;
using System.Data;
using System.Data.SqlClient;

namespace MoviePoster.DAL
{
    public class ProfileDao : IProfileDao
    {
        public Profile Add(Profile profile)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_add_profile", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = profile.FirstName;
                    cmd.Parameters.Add("@last_name", SqlDbType.VarChar).Value = profile.LastName;
                    cmd.Parameters.Add("@birthday", SqlDbType.VarChar).Value = profile.Birthday;
                    cmd.Parameters.Add("@gender", SqlDbType.VarChar).Value = profile.Gender;
                    cmd.Parameters.Add("@phone", SqlDbType.VarChar).Value = profile.Phone;
                    cmd.Parameters.Add("@patronymic_name", SqlDbType.VarChar).Value = profile.PatromymicName;

                    conn.con.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                        return profile;
                    else
                    {
                        // Handle exception.
                    }
                }
            }
            return null;
        }

        public IEnumerable<Profile> GetAll()
        {
            throw new NotImplementedException();
        }

        public Profile GetById(int profileId = 0, int userId = 0)
        {
            if (profileId != 0 || userId != 0)
            {
                using (Connection conn = new Connection())
                {
                    using (SqlCommand cmd = new SqlCommand("mov_get_profile_by_id", conn.con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        if (profileId != 0)
                        {
                            cmd.Parameters.Add("@profile_id", SqlDbType.Int).Value = profileId;
                        }
                        else
                        {
                            cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = userId;
                        }

                        conn.con.Open();

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var profile = new Profile(id: (int)reader["id"],
                                firstName: reader["name"] as string,
                                lastName: reader["last_name"] as string,
                                gender: reader["gender"] as string,
                                phone: reader["phone"] as string,
                                birthday: (DateTime)reader["birthday"],
                                patronimycName: reader["patronymic_name"] as string
                            );
                            return profile;
                        }
                    }
                }
            }
            return null;
        }

        public void Remove(int id)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_remove_profile", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;

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

        public void Update(int id, string name = null,
            string lastName = null, DateTime? birthday = null,
            string gender = null, string phone = null, string patronymicName = null)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_update_profile", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@name", SqlDbType.VarChar).Value = name;
                    cmd.Parameters.Add("@last_name", SqlDbType.VarChar).Value = lastName;
                    if(DateTime.TryParse(birthday.ToString(),out DateTime birthD))
                    {
                        cmd.Parameters.Add("@birthday", SqlDbType.VarChar).Value = birthD;
                    }
                    cmd.Parameters.Add("@gender", SqlDbType.VarChar).Value = gender;
                    cmd.Parameters.Add("@phone", SqlDbType.VarChar).Value = phone;
                    cmd.Parameters.Add("@patronymic_name", SqlDbType.VarChar).Value = patronymicName;

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
    }
}

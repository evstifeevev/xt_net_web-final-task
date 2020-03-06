using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using MoviePoster.DAL.Interfaces;
using MoviePoster.Entities;

namespace MoviePoster.DAL
{
    public class UserDao : IUserDao
    {
        public User Add(User user)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_add_user", conn.con)) {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@login", SqlDbType.VarChar).Value = user.Login;
                    cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = user.Password;
                    cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = user.Email;

                    conn.con.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                        return user;
                    else
                    {
                        // Handle exception.
                    }
                }                  
            }
            return null;
        }

        public void AddAddressById(int id, int addressId)
        {
            throw new NotImplementedException();
        }

        public void AddProfileById(int id, int profileId)
        {
            throw new NotImplementedException();
        }

        public void ChangeEmail(int id, string email)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_update_user", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
                    cmd.Parameters.Add("@email", SqlDbType.VarChar).Value = email;

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

        public void ChangeLogin(int id, string login)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_update_user", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
                    cmd.Parameters.Add("@login", SqlDbType.VarChar).Value = login;

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

        public void ChangePassword(int id, string password)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_update_user", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
                    cmd.Parameters.Add("@password", SqlDbType.VarChar).Value = password;

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

        public void ChangeRole(int id, string role)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_update_user_role", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;
                    cmd.Parameters.Add("@role", SqlDbType.VarChar).Value = role;

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

        public void ChangeStatus(int id, string status)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<User> GetAll()
        {
            throw new NotImplementedException();
        }

        public User GetById(int id)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_get_user_by_id", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@id", SqlDbType.VarChar).Value = id;

                    conn.con.Open();

                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        var user = new User(id: (int)reader["id"],
                            login: reader["login"] as string,
                            email: reader["email"] as string,
                            password: reader["password"] as string,
                            addressId: (int)reader["address_id"],
                            profileId: (int)reader["profile_id"],
                            status: reader["email"] as string,
                            role: reader["email"] as string,
                            createdAt: (DateTime)reader["created_at"],
                            updatedAt: (DateTime)reader["updated_at"]
                        );
                        return user;
                    }
                 
                }
            }
            return null;
        }

        public void Remove(int id)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_remove_user", conn.con))
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
    }
}

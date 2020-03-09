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
                    cmd.Parameters.Add("@id", SqlDbType.Int).Direction=ParameterDirection.Output;
                    conn.con.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                    {
                        user.Id = (int)cmd.Parameters["@id"].Value;
                        return user;
                    }
                        
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

                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
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

                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
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

                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
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

                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;
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
            var users = new List<User>();
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_get_all_user", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    conn.con.Open();

                    var reader = cmd.ExecuteReader();
                    
                    while (reader.Read())
                    {
                        int profId = 0;
                        if(int.TryParse(reader["profile_id"] as string, out profId))
                        {
                        }
                        int addrId = 0;
                        if(!(reader["address_id"] is System.DBNull))
                        {
                            addrId = (int)reader["address_id"];
                        } 
                        users.Add(new User(id: (int)reader["id"],
                            login: reader["login"] as string,
                            email: reader["email"] as string,
                            password: reader["password"] as string,
                            addressId: addrId,
                            profileId: profId,
                            status: reader["status"] as string,
                            role: reader["role"] as string,
                            createdAt: (DateTime)reader["created_at"]
                           // updatedAt: (DateTime)reader["updated_at"]
                        ));
                    }
                }
            }
            if (users.Count == 0) 
            {
                return null; 
            }
            return users;
        }

        public User GetById(int id)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_get_user_by_id", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;

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
                            status: reader["status"] as string,
                            role: reader["role"] as string,
                            createdAt: (DateTime)reader["created_at"],
                            updatedAt: (DateTime)reader["updated_at"]
                        );
                        return user;
                    }
                 
                }
            }
            return null;
        }

        public IEnumerable<User> GetMultiple(int start, int count)
        {
            var users = new List<User>();
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_get_multiple_user", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@start", SqlDbType.Int).Value = start;
                    cmd.Parameters.Add("@count", SqlDbType.Int).Value = count;

                    conn.con.Open();

                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        users.Add(GetById((int)reader["id"]));
                    }
                }
            }
            if (users.Count == 0)
            {
                return null;
            }
            return users;
        }

        public string GetUserRole(string login)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_get_user_role", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@login", SqlDbType.VarChar).Value = login;

                    conn.con.Open();

                    var reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                       return reader["role"] as string;
                    }
                }
            }
            return null;
        }

        public bool IsRegistered(string login = null, string email = null)
        {
            using (Connection conn = new Connection())
            {
                string query = login == null ? $"select id from [user] where email = \'{email}\'"
                    : $"select id from [user] where login = \'{login}\'";
                using (SqlCommand cmd = new SqlCommand(query, conn.con))
                {
                    cmd.CommandType = CommandType.Text;

                    conn.con.Open();

                    // If at least one record exists then user is registered
                    var reader = cmd.ExecuteReader();
                    var read = reader.Read();
                    return (read);
                }
            }
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

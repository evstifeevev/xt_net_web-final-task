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
    public class AddressDao : IAddressDao
    {
        public Address Add(Address address)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_add_address", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@country", SqlDbType.VarChar).Value = address.Country;
                    cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = address.City;
                    cmd.Parameters.Add("@postcode", SqlDbType.VarChar).Value = address.Postcode;
                    cmd.Parameters.Add("@state", SqlDbType.VarChar).Value = address.State;
                    cmd.Parameters.Add("@street_name", SqlDbType.VarChar).Value = address.StreetName;
                    cmd.Parameters.Add("@street_number", SqlDbType.VarChar).Value = address.StreetNumber;

                    conn.con.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                        return address;
                    else
                    {
                        // Handle exception.
                    }
                }
            }
            return null;
        }

        public IEnumerable<Address> GetAll()
        {
            var addresses = new List<Address>();
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_get_all_address", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    conn.con.Open();

                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        addresses.Add(new Address(id: (int)reader["id"],
                                country: reader["country"] as string,
                                city: reader["city"] as string,
                                streetName: reader["street_name"] as string,
                                streetNumber: reader["street_number"] as string,
                                state: reader["state"] as string,
                                postcode: reader["postcode"] as string
                            ));
                    }
                }
            }
            if (addresses.Count == 0)
            {
                return null;
            }
            return addresses;
        }

        public Address GetById(int addressId = 0, int userId = 0)
        {
            if (addressId != 0 || userId != 0)
            {
                using (Connection conn = new Connection())
                {
                    using (SqlCommand cmd = new SqlCommand("mov_get_address_by_id", conn.con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        if (addressId != 0)
                        {
                            cmd.Parameters.Add("@address_id", SqlDbType.Int).Value = addressId;
                        }
                        else
                        {
                            cmd.Parameters.Add("@user_id", SqlDbType.Int).Value = userId;
                        }

                        conn.con.Open();

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var address = new Address(id: (int)reader["id"],
                                country: reader["country"] as string,
                                city: reader["city"] as string,
                                streetName: reader["street_name"] as string,
                                streetNumber: reader["street_number"] as string,
                                state: reader["state"] as string,
                                postcode: reader["postcode"] as string
                            );
                            return address;
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
                using (SqlCommand cmd = new SqlCommand("mov_remove_address", conn.con))
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

        public void Update(int id, string country = null, string city = null,
            string postcode = null, string state = null,
            string streetName = null, string streetNumber = null)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_update_address", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@address_id", SqlDbType.VarChar).Value = id;
                    cmd.Parameters.Add("@country", SqlDbType.VarChar).Value = country;
                    cmd.Parameters.Add("@city", SqlDbType.VarChar).Value = city;
                    cmd.Parameters.Add("@postcode", SqlDbType.VarChar).Value = postcode;
                    cmd.Parameters.Add("@state", SqlDbType.VarChar).Value = state;
                    cmd.Parameters.Add("@street_name", SqlDbType.VarChar).Value = streetName;
                    cmd.Parameters.Add("@street_number", SqlDbType.VarChar).Value = streetNumber;

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

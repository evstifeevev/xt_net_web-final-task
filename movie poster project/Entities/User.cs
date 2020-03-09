using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoviePoster.Entities
{
    public class User
    {
        #region User fiels
        public int Id { get; set; }
        public string Login { get; set; }
        public string Password { get; set; } = string.Empty;
        public string Status { get; set; } = string.Empty;
        public string Role { get; set; } = string.Empty;
        public string Email { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public int ProfileId { get; set; }
        public int AddressId { get; set; }

        #endregion
        public User(string login, string email
            , int id = 0, string role = "", DateTime createdAt = default, 
            DateTime updatedAt = default,
            string password = "", string status = "", 
            int profileId = 0, int addressId = 0) {
            try
            {
                this.Id = id;
                this.Login = login;
                this.Password = password;
                this.Email = email;
                this.AddressId = addressId;
                this.ProfileId = profileId;
                this.Role = role;
                this.CreatedAt = createdAt;
                this.UpdatedAt = updatedAt;
                this.Status = status;


            }
            catch
            {
                throw;
            }
        }
    }
}

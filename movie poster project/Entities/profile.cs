using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoviePoster.Entities
{
    public class Profile
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PatromymicName { get; set; }
        public DateTime Birthday { get; set; }
        public string Gender { get; set; }
        public string Phone { get; set; }

        public Profile(int id, string firstName, string lastName, 
            string gender, string phone, DateTime birthday, string patronimycName = ""){
            try
            {
                this.Birthday = birthday;
                this.Id = id;
                this.Gender = gender;
                this.Phone = phone;
                this.LastName = lastName;
                this.FirstName = firstName;
                this.PatromymicName = patronimycName;
            }
            catch
            {
                throw;
            }
        }
    }
}

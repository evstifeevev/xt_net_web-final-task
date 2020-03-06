using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoviePoster.Entities
{
    public class Address
    {
        public int Id { get; set; }
        public string Country { get; set; }
        public string City { get; set; }
        public string Postcode { get; set; }
        public string State { get; set; }
        public string StreetName{ get; set; }
        public string StreetNumber { get; set; }

        public Address(int id, string country, string city, string postcode, 
            string state, string streetName, string streetNumber)
        {
            try
            {
                this.City = city;
                this.Country = country;
                this.Postcode = postcode;
                this.State = state;
                this.StreetName = streetName;
                this.StreetNumber = streetNumber;
            }
            catch 
            {
                throw;
            }
        }
    }
}

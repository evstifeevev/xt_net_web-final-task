using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoviePoster.Entities;

namespace MoviePoster.BLL.Interfaces
{
    public interface IAddressLogic
    {
        Address Add(Address address);
        void Remove(int id);
        Address GetById(int addressId = 0, int userId = 0);
        IEnumerable<Address> GetAll();
        void Update(int id, string country = null, string city = null,
            string postcode = null, string state = null,
            string streetName = null, string streetNumber = null);
    }
}

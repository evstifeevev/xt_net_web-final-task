using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoviePoster.BLL.Interfaces;
using MoviePoster.DAL.Interfaces;
using MoviePoster.Entities;

namespace MoviePoster.BLL
{
    public class AddressLogic : IAddressLogic
    {
        private readonly IAddressDao _addressDao;

        public AddressLogic(IAddressDao addressDao)
        {
            this._addressDao = addressDao;
        }
        public Address Add(Address address)
        {
            return _addressDao.Add(address);
        }

        public IEnumerable<Address> GetAll()
        {
            return _addressDao.GetAll();
        }

        public Address GetById(int addressId=0, int userId=0)
        {
            if(addressId==0 && userId == 0)
            {
                return null;
            }
            return _addressDao.GetById(addressId,userId);
        }

        public void Remove(int id)
        {
            _addressDao.Remove(id);
        }

        public void Update(int id, string country = null, 
            string city = null, string postcode = null, 
            string state = null, string streetName = null,
            string streetNumber = null)
        {
            _addressDao.Update(id,country,city,postcode,
                state,streetName,streetNumber);
        }
    }
}

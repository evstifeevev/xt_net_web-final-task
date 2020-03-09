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
    public class ProfileLogic : IProfileLogic
    {
        private readonly IProfileDao _profileDao;

        public ProfileLogic(IProfileDao profileDao)
        {
            this._profileDao = profileDao;
        }

        public Profile Add(Profile profile)
        {
            return _profileDao.Add(profile);
        }

        public IEnumerable<Profile> GetAll()
        {
            return _profileDao.GetAll();
        }

        public Profile GetById(int profileId = 0, int userId = 0)
        {
            return _profileDao.GetById(profileId, userId);
        }

        public void Remove(int id)
        {
            _profileDao.Remove(id);
        }

        public void Update(int id, string name = null,
            string lastName = null, DateTime? birthday = null, 
            string gender = null, string phone = null,
            string patronymicName = null)
        {
            if (phone != null)
            {
                // Phone processing
            }
            _profileDao.Update(id, name, lastName, birthday, gender,
                phone, patronymicName);
        }
    }
}

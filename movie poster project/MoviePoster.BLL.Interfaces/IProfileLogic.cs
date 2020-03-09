using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoviePoster.Entities;

namespace MoviePoster.BLL.Interfaces
{
    public interface IProfileLogic
    {
        Profile Add(Profile profile);
        void Remove(int id);
        Profile GetById(int profileId = 0, int userId = 0);
        IEnumerable<Profile> GetAll();
        void Update(int id, string name = null, string lastName = null,
            DateTime? birthday = null, string gender = null,
            string phone = null, string patronymicName = null);
    }
}

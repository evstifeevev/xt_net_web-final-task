using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoviePoster.Entities;

namespace MoviePoster.BLL.Interfaces
{
    public interface IUserLogic
    {
        User Add(User user);
        void Remove(int id);
        User GetById(int id);
        IEnumerable<User> GetAll();
        void ChangeLogin(int userId, string login);

        void ChangeEmail(int userId, string email);

        void ChangePassword(int userId, string password);

        void ChangeRole(int userId, string role);

        void ChangeStatus(int userId, string status);

        void AddAddressById(int userId, int addressId);

        void AddProfileById(int userId, int profileId);
    }
}

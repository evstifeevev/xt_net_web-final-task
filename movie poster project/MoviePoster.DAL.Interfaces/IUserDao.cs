using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoviePoster.Entities;

namespace MoviePoster.DAL.Interfaces
{
    public interface IUserDao
    {
        User Add(User user);
        void Remove(int id);
        User GetById(int id);
        IEnumerable<User> GetAll();
        IEnumerable<User> GetMultiple(int start, int count);
        bool IsRegistered(string login = null, string email = null);
        string GetUserRole(string login);
        void ChangeLogin(int userId, string login);

        void ChangeEmail(int userId,string email);

        void ChangePassword(int userId, string password);

        void ChangeRole(int userId, string role);

        void ChangeStatus(int userId, string status);

        void AddAddressById(int userId, int addressId);

        void AddProfileById(int userId, int profileId);

    }
}

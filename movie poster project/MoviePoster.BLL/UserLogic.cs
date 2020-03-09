using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoviePoster.BLL.Interfaces;
using MoviePoster.Entities;
using MoviePoster.DAL.Interfaces;
using MoviePoster.Logger;

namespace MoviePoster.BLL
{
    public class UserLogic : IUserLogic
    {
        private readonly IUserDao _userDao;

        public UserLogic(IUserDao userDao)
        {
            this._userDao = userDao;
        }

        public User Add(User user)
        {
            if (user.Password == string.Empty)
            {
                user.Role = "reviewer";
            }
            user.CreatedAt = DateTime.Now;
            //user.Password = user.Password.GetHashCode().ToString();
            return _userDao.Add(user);
        }



        public void AddAddressById(int userId, int addressId)
        {
            _userDao.AddAddressById(userId, addressId);
        }

        public void AddProfileById(int userId, int profileId)
        {
            _userDao.AddProfileById(userId, profileId);
        }

        public void ChangeEmail(int userId, string email)
        {
            _userDao.ChangeEmail(userId, email);
        }

        public void ChangeLogin(int userId, string login)
        {
            _userDao.ChangeLogin(userId, login);
        }

        public void ChangePassword(int userId, string password)
        {
            _userDao.ChangePassword(userId, password);
        }

        public void ChangeRole(int userId, string role)
        {
            _userDao.ChangeRole(userId, role);
        }

        public void ChangeStatus(int userId, string status)
        {
            _userDao.ChangeStatus(userId, status);
        }

        public IEnumerable<User> GetAll()
        {
            return _userDao.GetAll();
        }

        public User GetById(int id)
        {
            return _userDao.GetById(id);
        }

        public IEnumerable<User> GetMultiple(int start, int count)
        {
            return _userDao.GetMultiple(start, count);
        }

        public string GetUserRole(string login)
        {
            return _userDao.GetUserRole(login);
        }

        public bool IsRegistered(string login = null, string email = null)
        {
            if (login == null && email == null)
            {
                // Handle exception.
            }
            return _userDao.IsRegistered(login, email);
        }

        public bool IsAuthorized(string password, string login = null, string email = null)
        {
            if (login == null && email == null)
            {
                Logger.Logger.Log.Error(new ArgumentNullException("login, email",
                    "Login and email were not specified"));
                return false;
            }
            return _userDao.GetAll().Any(x => (x.Login == login || x.Email == email)
            && x.Password == password);
        }

        public void Remove(int id)
        {
            _userDao.Remove(id);
        }
    }
}

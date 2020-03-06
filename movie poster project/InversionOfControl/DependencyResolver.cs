using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoviePoster.BLL.Interfaces;
using MoviePoster.BLL;
using MoviePoster.DAL.Interfaces;
using MoviePoster.DAL;

namespace InversionOfControl
{
    public static class DependencyResolver
    {
		private static IUserDao _userDao;

		public static IUserDao UserDao
		{
			get { return _userDao ?? (_userDao = new UserDao()); }
		}

		private static IUserLogic _userLogic;

		public static IUserLogic UserLogic
		{
			get { return _userLogic ?? (_userLogic = new UserLogic(UserDao)); }
		}

	}
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoviePoster.BLL.Interfaces;
using MoviePoster.BLL;
using MoviePoster.DAL.Interfaces;
using MoviePoster.DAL;

namespace MoviePoster.InversionOfControl
{
    public static class DependencyResolver
    {
        #region User resolver
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
		#endregion

		#region Movie resolver
		private static IMovieDao _movieDao;

		public static IMovieDao MovieDao
		{
			get { return _movieDao ?? (_movieDao = new MovieDao()); }
		}

		private static IMovieLogic _movieLogic;

		public static IMovieLogic MovieLogic
		{
			get { return _movieLogic ?? (_movieLogic = new MovieLogic(MovieDao)); }
		}
		#endregion

		#region Address resolver
		private static IAddressDao _addressDao;

		public static IAddressDao AddressDao
		{
			get { return _addressDao ?? (_addressDao = new AddressDao()); }
		}

		private static IAddressLogic _addressLogic;

		public static IAddressLogic AddressLogic
		{
			get { return _addressLogic ?? (_addressLogic = new AddressLogic(AddressDao)); }
		}
		#endregion

		#region Profile resolver
		private static IProfileDao _profileDao;

		public static IProfileDao ProfileDao
		{
			get { return _profileDao ?? (_profileDao = new ProfileDao()); }
		}

		private static IProfileLogic _profileLogic;

		public static IProfileLogic ProfileLogic
		{
			get { return _profileLogic ?? (_profileLogic = new ProfileLogic(ProfileDao)); }
		}
		#endregion
	}
}

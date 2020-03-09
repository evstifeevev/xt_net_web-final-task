using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoviePoster.BLL.Interfaces;
using MoviePoster.Entities;
using MoviePoster.DAL.Interfaces;

namespace MoviePoster.BLL
{
    public class MovieLogic : IMovieLogic
    {
        private readonly IMovieDao _movieDao;

        private readonly int _movieCount = 0;

        public MovieLogic(IMovieDao movieDao)
        {
            this._movieDao = movieDao;
            _movieCount = movieDao.GetAll().Count();
        }
        public Movie Add(Movie movie)
        {
            return _movieDao.Add(movie);
        }

        public void ChangeBudget(int movieId, decimal budget)
        {
            _movieDao.ChangeBudget(movieId, budget);
        }

        public void ChangeDescription(int movieId, string description)
        {
            _movieDao.ChangeDescription(movieId, description);
        }

        public void ChangeInTheaters(int movieId, DateTime inTheaters)
        {
            _movieDao.ChangeInTheaters(movieId, inTheaters);
        }

        public void ChangeOnDiscs(int movieId, DateTime onDiscs)
        {
            _movieDao.ChangeOnDiscs(movieId, onDiscs);
        }

        public void ChangeOriginalLanguage(int movieId, string originalLanguage)
        {
            _movieDao.ChangeOriginalLanguage(movieId, originalLanguage);
        }

        public void ChangeOriginalTitle(int movieId, string originalTitle)
        {
            _movieDao.ChangeOriginalTitle(movieId, originalTitle);
        }

        public void ChangeRating(int movieId, string rating)
        {
            _movieDao.ChangeRating(movieId, rating);
        }

        public void ChangeRevenue(int movieId, decimal revenue)
        {
            _movieDao.ChangeRevenue(movieId, revenue);
        }

        public void ChangeRuntime(int movieId, DateTime runtime)
        {
            _movieDao.ChangeRuntime(movieId, runtime);
        }

        public void ChangeStatus(int movieId, string status)
        {
            _movieDao.ChangeStatus(movieId, status);
        }

        public void ChangeTitle(int movieId, string title)
        {
            _movieDao.ChangeTitle(movieId, title);
        }

        public IEnumerable<Movie> GetAll()
        {
            return _movieDao.GetAll();
        }

        public Movie GetById(int id)
        {
            return _movieDao.GetById(id);
        }

        public IEnumerable<Movie> GetMultiple(int start, int count)
        {
            if (count < 1)
            {
                Logger.Logger.LogError("Attempt to get negative amount of entities (Movie).");
                return new List<Movie>(0);
            }
            else
            if (start > _movieCount)
            {
                Logger.Logger.LogError("Start index is out of range (MovieLogic.GetMultiple).");
                return new List<Movie>(0);
            }
            else
            if (_movieCount < start + count)
            {
                
                count = _movieCount - start + 1;
                if (count < 1)
                {
                    Logger.Logger.LogError("Attempt to get entities (Movie) with start index >= elements amount.");
                }
                return _movieDao.GetMultiple(start, count);
            }
            else
            {
                return _movieDao.GetMultiple(start, count);
            }
           
        }

        public void Remove(int id)
        {
            _movieDao.Remove(id);
        }
        public IEnumerable<Movie> SearchMovie(string request)
        {
            if (request.Length < 3)
            {
                return new Movie[0];
            }
            return _movieDao.SearchMovie(request);
        }
    }
}

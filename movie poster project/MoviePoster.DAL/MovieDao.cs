using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoviePoster.DAL.Interfaces;
using MoviePoster.Entities;

namespace MoviePoster.DAL
{
    public class MovieDao : IMovieDao
    {
        public Movie Add(Movie movie)
        {
            throw new NotImplementedException();
        }

        public void ChangeBudget(int movieId, decimal budget)
        {
            throw new NotImplementedException();
        }

        public void ChangeDescription(int movieId, string description)
        {
            throw new NotImplementedException();
        }

        public void ChangeInTheaters(int movieId, DateTime inTheaters)
        {
            throw new NotImplementedException();
        }

        public void ChangeOnDiscs(int movieId, DateTime onDiscs)
        {
            throw new NotImplementedException();
        }

        public void ChangeOriginalLanguage(int movieId, string originalLanguage)
        {
            throw new NotImplementedException();
        }

        public void ChangeOriginalTitle(int movieId, string originalTitle)
        {
            throw new NotImplementedException();
        }

        public void ChangeRating(int movieId, string rating)
        {
            throw new NotImplementedException();
        }

        public void ChangeRevenue(int movieId, decimal revenue)
        {
            throw new NotImplementedException();
        }

        public void ChangeRuntime(int movieId, DateTime runtime)
        {
            throw new NotImplementedException();
        }

        public void ChangeStatus(int movieId, string status)
        {
            throw new NotImplementedException();
        }

        public void ChangeTitle(int movieId, string title)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Movie> GetAll()
        {
            throw new NotImplementedException();
        }

        public Movie GetById(int id)
        {
            throw new NotImplementedException();
        }

        public void Remove(int id)
        {
            throw new NotImplementedException();
        }
    }
}

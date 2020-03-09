using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoviePoster.Entities;

namespace MoviePoster.BLL.Interfaces
{
    public interface IMovieLogic
    {
        Movie Add(Movie movie);
        void Remove(int id);
        Movie GetById(int id);
        IEnumerable<Movie> GetAll();
        IEnumerable<Movie> GetMultiple(int start, int count);
        IEnumerable<Movie> SearchMovie(string request);
        void ChangeTitle(int movieId, string title);
        void ChangeOriginalTitle(int movieId, string originalTitle);
        void ChangeStatus(int movieId, string status);
        void ChangeOriginalLanguage(int movieId, string originalLanguage);
        void ChangeBudget(int movieId, decimal budget);
        void ChangeRevenue(int movieId, decimal revenue);
        void ChangeRuntime(int movieId, DateTime runtime);
        void ChangeDescription(int movieId, string description);
        void ChangeInTheaters(int movieId, DateTime inTheaters);
        void ChangeOnDiscs(int movieId, DateTime onDiscs);
        void ChangeRating(int movieId, string rating);
    }
}

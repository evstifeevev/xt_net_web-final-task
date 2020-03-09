using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoviePoster.Entities;

namespace MoviePoster.DAL.Interfaces
{
    public interface IGenreDao
    {
        Genre Add(Genre movie);
        void Remove(int id);
        Genre GetById(int id);
        IEnumerable<Genre> GetAll();
        void ChangeTitle(int genreId, string title);
    }
}

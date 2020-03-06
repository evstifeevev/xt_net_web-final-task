using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoviePoster.Entities
{
    public class Genre
    {
        #region Genre fiels
        public int Id { get; set; }
        public string Title { get; set; }
        #endregion 
        public Genre(int id, string title)
        {
            try
            {
                this.Id = id;
                this.Title = title;
            }
            catch
            {
                throw;
            }
        }
    }
}

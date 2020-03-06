using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoviePoster.Entities
{
    public class Movie
    {
        #region Movie fiels
        public int Id { get; set; }
        public string Title { get; set; }
        public string OriginalTitle { get; set; } = string.Empty;
        public string Status { get; set; } = string.Empty;
        public string OriginalLanguage { get; set; } = string.Empty;
        public DateTime Runtime { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public DateTime InTheaters { get; set; }
        public DateTime OnDiscs { get; set; }
        public decimal Budget { get; set; }
        public decimal Revenue { get; set; }
        public string Desctiption { get; set; }
        public string Rating { get; set; }
        #endregion
        public Movie(int id, string title, DateTime createdAt,
            string originalTitle = "", string originalLanguage = "", 
            string description = "", string status = "", DateTime runtime = default,
             DateTime updatedAt = default, DateTime inTheaters = default,
             DateTime onDiscs = default, string rating = "", 
             decimal budget = -1, decimal revenue = -1)
        {
            try
            {
                this.Id = id;
                this.Title = title;
                this.OriginalTitle = originalTitle;
                this.OriginalLanguage = originalLanguage;
                this.Desctiption = description;
                this.Runtime = runtime;
                this.OnDiscs = onDiscs;
                this.Rating = rating;
                this.InTheaters = inTheaters;
                this.Budget = budget;
                this.Revenue = revenue;
                this.UpdatedAt = updatedAt;
                this.CreatedAt = createdAt;
                this.Status = status;
            }
            catch
            {
                throw;
            }
        }
    }
}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MoviePoster.DAL.Interfaces;
using MoviePoster.Entities;
using System.Data;
using System.Data.SqlClient;

namespace MoviePoster.DAL
{
    public class MovieDao : IMovieDao
    {
        public Movie Add(Movie movie)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_add_movie", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = movie.Title;
                    cmd.Parameters.Add("@original_title", SqlDbType.VarChar).Value = movie.OriginalTitle;
                    cmd.Parameters.Add("@status", SqlDbType.VarChar).Value = movie.Status;
                    cmd.Parameters.Add("@original_language", SqlDbType.VarChar).Value = movie.OriginalLanguage;
                    cmd.Parameters.Add("@runtime", SqlDbType.Time).Value = movie.Runtime;
                    cmd.Parameters.Add("@budget", SqlDbType.Decimal).Value = movie.Budget;
                    cmd.Parameters.Add("@revenue", SqlDbType.Decimal).Value = movie.Revenue;
                    cmd.Parameters.Add("@in_theaters", SqlDbType.DateTime).Value = movie.InTheaters;
                    cmd.Parameters.Add("@on_discs", SqlDbType.DateTime).Value = movie.OnDiscs;
                    cmd.Parameters.Add("@description", SqlDbType.VarChar).Value = movie.Desctiption;
                    cmd.Parameters.Add("@rating", SqlDbType.VarChar).Value = movie.Rating;

                    conn.con.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                        return movie;
                    else
                    {
                        // Handle exception.
                    }
                }
            }
            return null;
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
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_update_movie", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = movieId;
                    cmd.Parameters.Add("@title", SqlDbType.VarChar).Value = title;

                    conn.con.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                        return;
                    else
                    {
                        // Handle exception.
                    }
                }
            }
        }

        public IEnumerable<Movie> GetAll()
        {
            var movies = new List<Movie>();
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_get_all_movie", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    conn.con.Open();

                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        movies.Add(new Movie(id: (int) reader["id"],
                            title: reader["title"] as string,
                            originalTitle: reader["original_title"] as string,
                            originalLanguage: reader["original_language"] as string,
                            status: reader["status"] as string,
                            description: reader["description"] as string,
                            rating: reader["rating"] as string,
                            //runtime: (DateTime)reader["runtime"],
                            createdAt: (DateTime)reader["created_at"]
                            //updatedAt: (DateTime)reader["updated_at"],
                            //inTheaters: (DateTime)reader["in_theaters"],
                            //onDiscs: (DateTime)reader["on_discs"],
                            //budget: (decimal)reader["budget"],
                            //revenue: (decimal)reader["revenue"]
                            ));
                    }
                }
            }
            if (movies.Count == 0)
            {
                return null;
            }
            return movies;
        }

        public Movie GetById(int id)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_get_movie_by_id", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;

                    conn.con.Open();

                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        DateTime runtime = default;
                        if(!DateTime.TryParse(reader["runtime"] as string,out runtime))
                        {
                            runtime = default;
                        }
                        var movie = new Movie(id: (int)reader["id"],
                            title: reader["title"] as string,
                            originalTitle: reader["original_title"] as string,
                            originalLanguage: reader["original_language"] as string,
                            status: reader["status"] as string,
                            description: reader["description"] as string,
                            rating: reader["rating"] as string,
                            runtime: runtime,
                            createdAt: (DateTime)reader["created_at"]
                            //updatedAt: (DateTime)reader["updated_at"],
                            //inTheaters: (DateTime)reader["in_theaters"],
                            //onDiscs: (DateTime)reader["on_discs"]
    );
                        return movie;
                    }

                }
            }
            return null;
        }

        public IEnumerable<Movie> GetMultiple(int start, int count)
        {
            var movies = new List<Movie>();
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_get_multiple_movie", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@start", SqlDbType.Int).Value = start;
                    cmd.Parameters.Add("@count", SqlDbType.Int).Value = count;

                    conn.con.Open();

                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        movies.Add(GetById((int)reader["id"]));
                    }
                }
            }
            if (movies.Count == 0)
            {
                return null;
            }
            return movies;
        }

        public void Remove(int id)
        {
            using (Connection conn = new Connection())
            {
                using (SqlCommand cmd = new SqlCommand("mov_remove_movie", conn.con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@id", SqlDbType.Int).Value = id;

                    conn.con.Open();
                    if (cmd.ExecuteNonQuery() == 1)
                        return;
                    else
                    {
                        // Handle exception.
                    }
                }
            }
        }
        public IEnumerable<Movie> SearchMovie(string request)
        {
            using (Connection conn = new Connection())
            {

                string query = $"select id,title,original_title, original_language," +
                    $"[status],original_language,runtime,budget,revenue,[description]," +
                    $"created_at,updated_at,in_theaters,on_discs,rating " +
                    $"from movie " +
                    $"where title like(\'%{request}%\') or original_title like (\'%{request}%\')";
                using (SqlCommand cmd = new SqlCommand(query, conn.con))
                {
                    var movies = new List<Movie>();

                    cmd.CommandType = CommandType.Text;

                    conn.con.Open();

                    var reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        movies.Add(new Movie(id: (int)reader["id"],
                          title: reader["title"] as string,
                          originalTitle: reader["original_title"] as string,
                          originalLanguage: reader["original_language"] as string,
                          status: reader["status"] as string,
                          description: reader["description"] as string,
                          rating: reader["rating"] as string,
                          //runtime: (DateTime)reader["runtime"],
                          createdAt: (DateTime)reader["created_at"]
                          //updatedAt: (DateTime)reader["updated_at"],
                          //inTheaters: (DateTime)reader["in_theaters"],
                          //onDiscs: (DateTime)reader["on_discs"],
                          //budget: (decimal)reader["budget"],
                          //revenue: (decimal)reader["revenue"]
                          ));
                    }
                    return movies;
                }
            }
            return new Movie[0];
        }
    }
}

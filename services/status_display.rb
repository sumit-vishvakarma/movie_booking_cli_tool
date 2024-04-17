class StatusDisplay
  class << self
    def display_status(movies)
      formatted_status = format_movies(movies)
      puts formatted_status
    end

    private

    def format_movies(movies)
      movies.map { |movie| format_movie(movie) }.join("\n\n")
    end

    def format_movie(movie)
      movie_info = "Movie: #{movie.title}"
      show_info = movie.shows.map { |show| format_show(show) }.join("\n")
      "#{movie_info}\n#{show_info}"
    end

    def format_show(show)
      available_seats = show.seats - show.booked_seats.size
      "  Show Time: #{show.time}, Available Seats: #{available_seats}/#{show.seats}"
    end
  end
end

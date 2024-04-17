require_relative '../initializer/movie'

class TicketCancellation
  class << self
    def cancel_ticket(movies, title, show_time, number_of_seats)
      movie, show = validate_booking(movies, title, show_time, number_of_seats)
      cancel_seat_booking(show, number_of_seats)
      "Cancelled booking for '#{title}' at #{show_time}, number of seat: #{number_of_seats}."
    end

    private

    def validate_booking(movies, title, show_time, number_of_seats)
      movie = movies.find { |m| m.title == title }
      raise "Movie not found" unless movie

      show = movie.shows.find { |s| s.time == show_time }
      raise "Show not found" unless show

      raise "Seat not booked" unless number_of_seats <= show.booked_seats.length

      return movie, show
    end

    def cancel_seat_booking(show, number_of_seats)
      cancelled_seats = show.booked_seats.last(number_of_seats)
      show.booked_seats -= cancelled_seats
    end
  end
end

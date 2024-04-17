require 'pry'
require_relative 'movie_initializer'
require_relative 'services/movie_ticket_booking'
require_relative 'services/status_display'
require_relative 'services/ticket_cancellation'

class MovieBookingCLI
  def initialize(movies)
    @movies = movies
  end

  def start
    puts "Welcome to the Movie Booking System"
    loop do
      display_options
      handle_choice(get_user_input("Enter your choice: ", Integer))
    end
  end

  private

  def display_options
    puts "\nOptions:"
    puts "1. Book a ticket"
    puts "2. Cancel a ticket"
    puts "3. Display status"
    puts "4. Exit"
  end

  def handle_choice(choice)
    case choice
    when 1 then book_ticket
    when 2 then cancel_ticket
    when 3 then display_status
    when 4 then exit_program
    else puts "Invalid option. Please try again."
    end
  end

  def book_ticket
    details = request_booking_details
    MovieTicketBooking.book_ticket(@movies, details[:title], details[:show_time], details[:num_of_tickets])
  end

  def cancel_ticket
    details = request_cancellation_details
    TicketCancellation.cancel_ticket(@movies, details[:title], details[:show_time], details[:number_of_seats])
  end

  def display_status
    StatusDisplay.display_status(@movies)
  end

  def exit_program
    puts "Thank you for using the Movie Booking System."
    exit
  end

  def request_booking_details
    title = get_user_input("Enter movie title: ", String)
    show_time = get_user_input("Enter show time: ", String)
    num_of_tickets = get_user_input("Enter number of tickets: ", Integer)
    { title: title, show_time: show_time, num_of_tickets: num_of_tickets }
  end

  def request_cancellation_details
    title = get_user_input("Enter movie title: ", String)
    show_time = get_user_input("Enter show time: ", String)
    number_of_seats = get_user_input("Enter seat number to cancel: ", Integer)
    { title: title, show_time: show_time, number_of_seats: number_of_seats }
  end

  def get_user_input(prompt, type)
    print prompt
    input = gets.chomp
    return input.to_i if type == Integer
    input
  end
end

movies = movie_initializer
cli = MovieBookingCLI.new(movies)
cli.start

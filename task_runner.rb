require 'pry'

class MovieBookingCLI
  def start
    puts "Welcome to the Movie Booking System"
    loop do
      display_options
      choice = gets.chomp.to_i
      handle_choice(choice)
    end
  end

  private

  def display_options
    puts "\nOptions:"
    puts "1. Book a ticket"
    puts "2. Cancel a ticket"
    puts "3. Display status"
    puts "4. Exit"
    print "Enter your choice: "
  end

  def handle_choice(choice)
    case choice
    when 1 then book_ticket
    when 2 then cancel_ticket
    when 3 then display_status
    when 4 then exit_system
    else puts "Invalid option. Please try again."
    end
  end

  def book_ticket
    puts "Book movie ticket"
  end

  def cancel_ticket
    puts "Cancel Movie ticket"
  end

  def display_status
    puts "Display status"
  end

  def exit_system
    puts "Thank you for using the Movie Booking System."
    exit
  end
end

MovieBookingCLI.new.start

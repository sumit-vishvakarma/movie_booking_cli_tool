class Show
  attr_accessor :time, :seats, :booked_seats

  def initialize(time, seats, booked_seats = [])
    @time = time
    @seats = seats
    @booked_seats = booked_seats
  end
end

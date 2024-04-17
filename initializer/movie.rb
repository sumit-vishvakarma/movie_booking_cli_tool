class Movie
  attr_accessor :title, :genre, :shows

  def initialize(title, genre, shows = [])
    @title = title
    @genre = genre
    @shows = shows
  end
end

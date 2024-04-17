require 'json'
require 'pry'

def movie_initializer
  file_path = 'data/cinema_showtimes.json'
  movie_data = JSON.parse(File.read(file_path))
  puts movie_data
end

movie_initializer

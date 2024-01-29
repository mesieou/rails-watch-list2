require 'json'
require 'open-uri'

url = 'https://tmdb.lewagon.com/movie/top_rated'
open_url = URI.open(url).read
result = JSON.parse(open_url)
movies = result['results'].first(10)

puts 'Cleaning the database'
Movie.destroy_all

puts "Creating movies"
movies.each do |movie|
  Movie.create!(
    title: movie['original_title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
  )
  puts "#{movie['original_title']} created!"
end
puts "All finished"

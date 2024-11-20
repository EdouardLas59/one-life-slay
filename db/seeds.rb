# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
require "json"
require "net/http"
require "faker"

Booking.destroy_all
Movie.destroy_all
User.destroy_all

axel = User.create(email: "axel@mail.com", password: "password", address: "2 avenue des saules, Lille 59000")
alex = User.create(email: "alex@mail.com", password: "password", address: "2 avenue des saules, Lille 59000")
math = User.create(email: "math@mail.com", password: "password", address: "2 avenue des saules, Lille 59000")
edouard = User.create(email: "edouard@mail.com", password: "password", address: "2 avenue des saules, Lille 59000")
poster_urls = [
  "https://posters.movieposterdb.com/24_06/2024/16366836/l_venom-the-last-dance-movie-poster_a982082b.jpg",
  "https://posters.movieposterdb.com/24_09/2024/28015403/l_heretic-movie-poster_5aebf7ad.jpg",
  "https://posters.movieposterdb.com/24_05/2024/6263850/l_deadpool-wolverine-movie-poster_ca977381.jpg",
  "https://posters.movieposterdb.com/14_09/2014/816692/l_816692_593eaeff.jpg",
  "https://posters.movieposterdb.com/24_07/1985/88763/l_back-to-the-future-movie-poster_616b0733.jpg",
  "https://posters.movieposterdb.com/08_05/2008/468569/l_468569_f0e2cd63.jpg",
  "https://posters.movieposterdb.com/20_10/2012/848228/l_848228_9bc5bc2a.jpg",
  "https://posters.movieposterdb.com/24_11/2025/9603208/l_mission-impossible-the-final-reckoning-movie-poster_5e87e06d.jpg",
  "https://posters.movieposterdb.com/24_09/2024/1262426/l_wicked-movie-poster_63536922.jpg",
  "https://posters.movieposterdb.com/24_08/2024/29623480/l_the-wild-robot-movie-poster_7e1b9c37.jpg",
  "https://posters.movieposterdb.com/24_10/0/20215234/l_conclave-movie-poster_d7d40474.jpg", # Interstellar
  "https://posters.movieposterdb.com/24_11/2024/2347285/l_the-best-christmas-pageant-ever-movie-poster_817421f3.jpg",
  "https://posters.movieposterdb.com/24_08/2024/17526714/l_the-substance-movie-poster_1dbeba64.jpg",
  "https://posters.movieposterdb.com/24_11/2024/32245065/l_matki-pingwinw-movie-poster_e1a9e927.jpg",
  "https://posters.movieposterdb.com/13_02/2001/241527/l_241527_da927a3d.jpg",
  "https://posters.movieposterdb.com/09_06/2009/417741/l_417741_5ac81107.jpg",
  "https://posters.movieposterdb.com/24_06/2002/167261/l_the-lord-of-the-rings-the-two-towers-movie-poster_28018e33.jpg",
  "https://posters.movieposterdb.com/22_06/2001/120737/l_120737_0ff31144.jpg",
  "https://posters.movieposterdb.com/24_06/2002/167261/l_the-lord-of-the-rings-the-two-towers-movie-poster_28018e33.jpg",
  "https://posters.movieposterdb.com/22_05/2016/4061080/l_4061080_b4baee88.jpg",
  "https://posters.movieposterdb.com/22_07/2021/10273784/l_10273784_e75bc38e.jpg",
  "https://posters.movieposterdb.com/08_10/1929/20581/l_20581_917823aa.jpg",
  "https://posters.movieposterdb.com/19_12/2016/4249242/l_4249242_bc9e1d3c.jpg",
  "https://posters.movieposterdb.com/07_11/2000/264263/l_264263_85ba00ef.jpg",
  "https://posters.movieposterdb.com/08_01/2006/493430/l_493430_d63c78f8.jpg",
  "https://posters.movieposterdb.com/10_12/2002/322802/l_322802_b0849c48.jpg",
]
categories = ["Action", "Fantasy", "Horror", "Comedy", "Sci-Fi", "Thriller"]
100.times do
  title = Faker::Movie.title
  movie = Movie.create!(
    title: title,
    review: [
      "#{Faker::Movie.title} follows #{Faker::Name.name}, a #{Faker::Job.title.downcase} from #{Faker::Address.city}. When they discover a secret about #{Faker::Company.name}, they must team up with #{Faker::Name.name}, a #{Faker::Job.title.downcase}, to uncover a plot that could threaten the future.",
      "#{Faker::Movie.title} tells the story of #{Faker::Name.name}, a #{Faker::Job.title.downcase} in #{Faker::Address.city}. When their investigation into #{Faker::Company.name} leads them to a web of lies, they uncover a conspiracy that forces them to make a life-changing decision.",
      "#{Faker::Movie.title} is about #{Faker::Name.name}, a #{Faker::Job.title.downcase} who uncovers a dark secret hidden within #{Faker::Company.name}. Alongside #{Faker::Name.name}, a #{Faker::Job.title.downcase}, they must expose the truth before it’s buried forever.",
      "#{Faker::Movie.title} follows #{Faker::Name.name}, a #{Faker::Job.title.downcase} who stumbles upon a dangerous plot involving #{Faker::Company.name}. As they race against time, they uncover a conspiracy that could alter history. With the help of #{Faker::Name.name}, a #{Faker::Job.title.downcase}, they try to stop the forces behind it.",
      "#{Faker::Movie.title} tells the journey of #{Faker::Name.name}, a #{Faker::Job.title.downcase} from #{Faker::Address.city}. When they discover a hidden connection between #{Faker::Company.name} and a powerful organization, they must decide if they will expose the truth or protect their own life.",
      "#{Faker::Movie.title} follows #{Faker::Name.name}, a #{Faker::Job.title.downcase} who uncovers a dangerous secret within #{Faker::Company.name}. Now, with the help of #{Faker::Name.name}, a #{Faker::Job.title.downcase}, they must fight against a corrupt system to bring the truth to light."
              ].sample,
    poster_url: poster_urls.sample,
    rating: rand(1..10).round(1),
    director: Faker::Name.name,
    actors: "#{Faker::Name.name}, #{Faker::Name.name}, #{Faker::Name.name}",
    genre: categories.sample,
    year: rand(1950..2024).round(1),
    user: User.last
  )
  puts "#{movie.title} created"
end
puts "Seeded #{Movie.count} movies"

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

Movie.create!(
title: "The Dark Knight",
review: "When a menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman, James Gordon and Harvey Dent must work together to put an end to the madness.",
poster_url: "https://xl.movieposterdb.com/08_06/2008/468569/xl_468569_fe24b125.jpg",
rating: 9.0,
director: "Christopher Nolan",
actors: "Heath Ledger, Christian Bale",
genre: "Thriller",
year: "2008",
quality: "good",
price: 4,
user: User.first)

Movie.create!(
title: "The Lord of the Rings: The Return of the King",
review: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
poster_url: "https://xl.movieposterdb.com/22_11/2003/167260/xl_the-lord-of-the-rings-the-return-of-the-king-movie-poster_a977da10.jpg",
rating: 9.0,
director: "Peter Jackson",
actors: "Sean Astin, Viggo Mortensen",
genre: "Fantasy",
year: "2003",
quality: "average",
price: 3,
user: User.first)

Movie.create!(
title: "The Matrix",
review: "When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.",
poster_url: "https://xl.movieposterdb.com/06_11/1999/0133093/xl_145384_0133093_fd241228.jpg",
rating: 8.7,
director: "Wachowski sisters",
actors: "Keanu Reeves, Hugo Weaving",
genre: "Science-Fiction",
year: "1999",
quality: "very good",
price: 5,
user: User.first)

Movie.create!(
title: "Mad Max: Fury Road",
review: "In a post-apocalyptic wasteland, a woman rebels against a tyrannical ruler in search for her homeland with the aid of a group of female prisoners, a psychotic worshipper and a drifter named Max.",
poster_url: "https://xl.movieposterdb.com/15_05/2015/1392190/xl_1392190_1ae64e1a.jpg",
rating: 8.1,
director: "George Miller",
actors: "Tom Hardy, Charlize Theron",
genre: "Science-Fiction",
year: "2015",
quality: "poor",
price: 2,
user: User.first)

Movie.create!(
title: "Ready Player One",
review: "When the creator of a virtual reality called the OASIS dies, he makes a posthumous challenge to all OASIS users to find his Easter Egg, which will give the finder his fortune and control of his world.",
poster_url: "https://xl.movieposterdb.com/20_06/2018/1677720/xl_1677720_376c9e0b.jpg",
rating: 7.4,
director: "Steven Spielberg",
actors: "Tye Sheridan, Ben Mendelsohn",
genre: "Science-Fiction",
year: "2018",
quality: "good",
price: 4,
user: User.first)

Movie.create!(
title: "Schindler's List",
review: "In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.",
poster_url: "https://xl.movieposterdb.com/21_03/1993/108052/xl_108052_bd91d0b6.jpg",
rating: 9.0,
director: "Steven Spielberg",
actors: "Liam Neeson, Ralph Fiennes",
genre: "Drama",
year: "1994",
quality: "average",
price: 3,
user: User.first)

Movie.create!(
title: "The Godfather Part II",
review: "The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.",
poster_url: "https://xl.movieposterdb.com/21_06/1974/71562/xl_71562_88e1f048.jpg",
rating: 9.0,
director: "Francis Ford Coppola",
actors: "Al Pacino, Robert De Niro",
genre: "Drama",
year: "1994",
quality: "very good",
price: 5,
user: User.first)

Movie.create!(
title: "Apocalypse Now",
review: "A U.S. Army officer serving in Vietnam is tasked with assassinating a renegade Special Forces Colonel who sees himself as a god.",
poster_url: "https://xl.movieposterdb.com/08_05/1979/78788/xl_78788_600da6a4.jpg",
rating: 8.4,
director: "Francis Ford Coppola",
actors: "Martin Sheen, Marlon Brando",
genre: "War",
year: "1979",
quality: "poor",
price: 2,
user: User.first)

Movie.create!(
title: "Terminator 2: Judgment Day",
review: "A cyborg, identical to the one who failed to kill Sarah Connor, must now protect her ten year old son John from an even more advanced and powerful cyborg.",
poster_url: "https://xl.movieposterdb.com/20_11/1991/103064/xl_103064_658fc830.jpg",
rating: 8.6,
director: "James Cameron",
actors: "Arnold Schwarzenegger, Linda Hamilton",
genre: "Science-Fiction",
year: "1991",
quality: "good",
price: 4,
user: User.first)

Movie.create!(
title: "Star Wars: Episode V - The Empire Strikes Back",
review: "After the Empire overpowers the Rebel Alliance, Luke Skywalker begins his Jedi training with Yoda. At the same time, Darth Vader and bounty hunter Boba Fett pursue his friends across the galaxy.",
poster_url: "https://xl.movieposterdb.com/12_03/1980/80684/xl_80684_47982fe2.jpg",
rating: 8.7,
director: "Irvin Kershner",
actors: "Mark Hamill, Harrison Ford",
genre: "Science-Fiction",
year: "1980",
quality: "average",
price: 3,
user: User.first)

Movie.create!(
title: "American History X",
review: "Living a life marked by violence, neo-Nazi Derek finally goes to prison after killing two black youths. Upon his release, Derek vows to change; he hopes to prevent his brother, Danny, who idolizes Derek, from following in his footsteps.",
poster_url: "https://xl.movieposterdb.com/05_07/1998/0120586/xl_38913_0120586_9e761856.jpg",
rating: 8.5,
director: "Tony Kaye",
actors: "Edward Norton, Edward Furlong",
genre: "Drama",
year: "1998",
quality: "very good",
price: 5,
user: User.first)

Movie.create!(
title: "Heat",
review: "A group of high-end professional thieves start to feel the heat from the LAPD when they unknowingly leave a verbal clue at their latest heist.",
poster_url: "https://xl.movieposterdb.com/05_03/1995/0113277/xl_10324_0113277_21d91b53.jpg",
rating: 8.3,
director: "Michael Mann",
actors: "Al Pacino, Robert De Niro",
genre: "Thriller",
year: "1995",
quality: "poor",
price: 2,
user: User.first)

Movie.create!(
title: "Jurassic Park",
review: "An industrialist invites some experts to visit his theme park of cloned dinosaurs. After a power failure, the creatures run loose, putting everyone's lives, including his grandchildren's, in danger.",
poster_url: "https://xl.movieposterdb.com/05_08/1993/0107290/xl_45298_0107290_be4e0db3.jpg",
rating: 8.2,
director: "Steven Spielberg",
actors: "Sam Neill, Laura Dern",
genre: "Science-Fiction",
year: "1993",
quality: "good",
price: 4,
user: User.first)

Movie.create!(
title: "Back to the Future",
review: "Marty McFly, a 17-year-old high school student, is accidentally sent 30 years into the past in a time-traveling DeLorean invented by his close friend, the maverick scientist Doc Brown.",
poster_url: "https://xl.movieposterdb.com/24_07/1985/88763/xl_back-to-the-future-movie-poster_616b0733.jpg",
rating: 8.5,
director: "Robert Zemeckis",
actors: "Michael J.Fox, Christopher Lloyd",
genre: "Science-Fiction",
year: "1985",
quality: "average",
price: 3,
user: User.first)

Movie.create!(
title: "Forrest Gump",
review: "The history of the United States from the 1950s to the '70s unfolds from the perspective of an Alabama man with an IQ of 75, who yearns to be reunited with his childhood sweetheart.",
poster_url: "https://xl.movieposterdb.com/12_04/1994/109830/xl_109830_58524cd6.jpg",
rating: 8.8,
director: "Robert Zemeckis",
actors: "Tom Hanks, Robin Wright",
genre: "Drama",
year: "1994",
quality: "very good",
price: 5,
user: User.first)

Movie.create!(
title: "Saving Private Ryan",
review: "Following the Normandy Landings, a group of U.S. soldiers go behind enemy lines to retrieve a paratrooper whose brothers have been killed in action.",
poster_url: "https://xl.movieposterdb.com/21_04/1998/120815/xl_120815_118206a4.jpg",
rating: 8.6,
director: "Steven Spielberg",
actors: "Tom Hanks, Matt Damon",
genre: "War",
year: "1998",
quality: "poor",
price: 2,
user: User.first)

Movie.create!(
title: "12 Angry Men",
review: "The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.",
poster_url: "https://xl.movieposterdb.com/07_11/1957/50083/xl_50083_c5ce989e.jpg",
rating: 9.0,
director: "Sidney Lumet",
actors: "Henry Fonda, Lee J.Cobb",
genre: "Drama",
year: "1957",
quality: "good",
price: 4,
user: User.first)

Movie.create!(
title: "Indiana Jones and the Last Crusade",
review: "In 1938, after his father goes missing while pursuing the Holy Grail, Indiana Jones finds himself up against the Nazis again to stop them from obtaining its powers.",
poster_url: "https://xl.movieposterdb.com/06_08/1989/0097576/xl_128757_0097576_903dcfd5.jpg",
rating: 8.2,
director: "Steven Spielberg",
actors: "Harrison Ford, Sean Connery",
genre: "Adventure",
year: "1989",
quality: "average",
price: 3,
user: User.first)

Movie.create!(
title: "Watchmen",
review: "In a version of 1985 where superheroes exist, the murder of a colleague sends active vigilante Rorschach on the trail of a conspiracy that will change the course of history.",
poster_url: "https://xl.movieposterdb.com/09_02/2009/409459/xl_409459_29f9c455.jpg",
rating: 7.6,
director: "Zack Snyder",
actors: "Jackie Earle Haley, Patrick Wilson",
genre: "Science-Fiction",
year: "2009",
quality: "very good",
price: 5,
user: User.first)

Movie.create!(
title: "Sin City",
review: "An exploration of the dark and miserable Basin City and three of its residents, all of whom are caught up in violent corruption.",
poster_url: "https://xl.movieposterdb.com/08_09/2005/401792/xl_401792_f03f7b88.jpg",
rating: 8.0,
director: "Robert Rodriguez",
actors: "Mickey Rourke, Bruce Willis",
genre: "Thriller",
year: "2005",
quality: "poor",
price: 2,
user: User.first)

Movie.create!(
title: "Se7en",
review: "Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.",
poster_url: "https://xl.movieposterdb.com/14_12/1995/114369/xl_114369_156764e9.jpg",
rating: 8.6,
director: "David Fincher",
actors: "Brad Pitt, Morgan Freeman",
genre: "Thriller",
year: "1995",
quality: "good",
price: 4,
user: User.first)

Movie.create!(
title: "Goodfellas",
review: "The story of Henry Hill and his life in the mafia, covering his relationship with his wife Karen and his mob partners Jimmy Conway and Tommy DeVito.",
poster_url: "https://xl.movieposterdb.com/24_07/1990/99685/xl_goodfellas-movie-poster_8d37cedd.jpg",
rating: 8.7,
director: "Martin Scorsese",
actors: "Robert De Niro, Joe Pesci",
genre: "Crime",
year: "1990",
quality: "average",
price: 3,
user: User.first)

Movie.create!(
title: "The Silence of the Lambs",
review: "A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.",
poster_url: "https://xl.movieposterdb.com/23_08/1991/102926/xl_the-silence-of-the-lambs-movie-poster_cf602623.jpg",
rating: 8.6,
director: "Jonathan Demme",
actors: "Jodie Foster, Anthony Hopkins",
genre: "War",
year: "1991",
quality: "very good",
price: 5,
user: User.first)

Movie.create!(
title: "Sorcerer",
review: "Four unfortunate men from different parts of the globe agree to risk their lives transporting gallons of nitroglycerin across dangerous Latin American jungle.",
poster_url: "https://xl.movieposterdb.com/14_04/1977/76740/xl_76740_a1b14862.jpg",
rating: 7.7,
director: "William Friedkin",
actors: "Roy Scheider, Bruno Cremer",
genre: "Thriller",
year: "1977",
quality: "poor",
price: 2,
user: User.first)

Movie.create!(
title: "Seven Samurai",
review: "Farmers from a village exploited by bandits hire a veteran samurai for protection, and he gathers six other samurai to join him.",
poster_url: "https://xl.movieposterdb.com/08_04/1954/47478/xl_47478_a851d195.jpg",
rating: 8.6,
director: "Akira Kurosawa",
actors: "Toshirô Mifune, Takashi Shimura",
genre: "Drama",
year: "1954",
quality: "good",
price: 4,
user: User.first)

Booking.create([
  {
    date_start: Date.today - 1,
    date_end: Date.today + 5,
    total_price: 50,
    pickup_place: "Paris Gare",
    user: alex,
    movie: Movie.last
  },
  {
    date_start: Date.today - 10,
    date_end: Date.today + 15,
    total_price: 100,
    pickup_place: "Aéroport Charles-de-Gaulle",
    user: alex,
    movie: Movie.find(Movie.last.id - 1)
  },
  {
    date_start: Date.today - 20,
    date_end: Date.today + 25,
    total_price: 75,
    pickup_place: "Lyon Part-Dieu",
    user: alex,
    movie: Movie.first
  }
])

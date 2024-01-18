User.create!(email: "admin@domain.com", password: "password", password_confirmation: "password")

thriller = Genre.create!(name: "Thiller")
history = Genre.create!(name: "History")
fantasy = Genre.create!(name: "Fantasy")
scifi = Genre.create!(name: "Science Fiction")
comedy = Genre.create!(name: "Comedy")

movies = [
  {
    name: "The Dark Knight", 
    description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
    poster: "batman",
    rating: 4,
    released_at: '2018-01-01',
    genre_id: thriller.id
  },
  {
    name: "The Godfather", 
    description: "Don Vito Corleone, head of a mafia family, decides to hand over his empire to his youngest son Michael. However, his decision unintentionally puts the lives of his loved ones in grave danger.",
    poster: "godfather",
    rating: 5,
    released_at: '1972-01-01',
    genre_id: thriller.id
  },
  {
    name: "Schindler's List", 
    description: "In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.",
    poster: "schindler",
    rating: 4,
    released_at: '1993-01-01',
    genre_id: history.id
  },
  {
    name: "The Lord of the Rings", 
    description: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.",
    poster: "lord",
    rating: 4,
    released_at: '2003-01-01',
    genre_id: fantasy.id
  },
  {
    name: "Pulp Fiction", 
    description: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
    poster: "pulp",
    rating: 4,
    released_at: '1994-01-01',
    genre_id: thriller.id
  },
  {
    name: "Forrest Gump", 
    description: "The history of the United States from the 1950s to the '70s unfolds from the perspective of an Alabama man with an IQ of 75, who yearns to be reunited with his childhood sweetheart.",
    poster: "forest",
    rating: 3,
    released_at: '1994-01-01',
    genre_id: comedy.id
  },
  {
    name: "Fight Club", 
    description: "An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.",
    poster: "fight",
    rating: 3,
    released_at: '1999-01-01',
    genre_id: thriller.id
  },
  {
    name: "Inception", 
    description: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.",
    poster: "inception",
    rating: 5,
    released_at: '2010-01-01',
    genre_id: thriller.id
  },
  {
    name: "Star Wars: Episode V", 
    description: "After the Rebels are overpowered by the Empire, Luke Skywalker begins his Jedi training with Yoda, while his friends are pursued across the galaxy by Darth Vader and bounty hunter Boba Fett.",
    poster: "inception",
    rating: 5,
    released_at: '1980-01-01',
    genre_id: scifi.id
  },
  {
    name: "The Matrix", 
    description: "When a beautiful stranger leads computer hacker Neo to a forbidding underworld, he discovers the shocking truth--the life he knows is the elaborate deception of an evil cyber-intelligence.",
    poster: "matrix",
    rating: 4,
    released_at: '1999-01-01',
    genre_id: scifi.id
  },
  {
    name: "Interstellar", 
    description: "When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.",
    poster: "interstellar",
    rating: 4,
    released_at: '2014-01-01',
    genre_id: scifi.id
  },
  {
    name: "Terminator 2: Judgment Day", 
    description: "A cyborg, identical to the one who failed to kill Sarah Connor, must now protect her ten year old son John from an even more advanced and powerful cyborg.",
    poster: "terminator",
    rating: 4,
    released_at: '1991-01-01',
    genre_id: scifi.id
  }
]

movies.each do |movie| 
  
  m = Movie.create!(
    name: movie[:name], 
    description: movie[:description], 
    rating: movie[:rating], 
    released_at: movie[:released_at], 
    genre_id: movie[:genre_id],  
  )

  puts m.name
  poster_64 = Base64.encode64(File.read(Rails.root.join('test', 'fixtures', 'files', "#{movie[:poster]}.jpg")))
  m.handle_poster(poster_64)

  # Avoid crashing SQLite "BusyException: database is locked"
  sleep 1
end

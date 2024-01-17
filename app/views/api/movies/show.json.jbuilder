json.movie do
  json.id @movie.id
  json.name @movie.name
  json.description @movie.description
  json.rating @movie.rating
  json.genre t(@movie.genre.name, scope: 'genres')
end

json.movie do
  json.id @movie.id
  json.name @movie.name
  json.genre @movie.genre.name
end

json.genres Genre.all.each do |genre|
  json.id genre.id
  json.name t(genre.name, scope: 'genres')
end
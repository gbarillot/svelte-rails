json.movie do
  json.id @movie.id
  json.name @movie.name
  json.description @movie.description
  json.rating @movie.rating
  json.released_at @movie.released_at
  json.restricted "#{@movie.restricted}"
  json.rating @movie.rating
  json.genre_id @movie.genre.id
end

json.genres Genre.all.each do |genre|
  json.id genre.id
  json.name genre.name
end
json.movie do
  json.name @movie.name
  json.description @movie.description
  json.rating 1
  json.released_at @movie.released_at
  json.restricted "#{@movie.restricted}"
  json.genre_id nil
  json.poster_url ''
end

json.genres Genre.all.each do |genre|
  json.id genre.id
  json.name t(genre.name, scope: 'genres')
end
json.movie do
  json.name @movie.name
  json.genre_id nil 
end

json.genres Genre.all.each do |genre|
  json.id genre.id
  json.name t(genre.name, scope: 'genres')
end
json.movies @movies.each do |movie|
  json.id movie.id
  json.created_at l(movie.created_at, format: :default)
  json.name movie.name
  json.genre t(movie.genre.name, scope: 'bands')
end

json.genres Genre.all.each do |genre|
  json.id genre.id
  json.name t(genre.name, scope: 'genres')
end

json.partial! partial: '/api/admin/shared/pagination', locals: {
  kind: @movies
}

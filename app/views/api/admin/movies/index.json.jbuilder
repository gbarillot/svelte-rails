json.movies @movies.each do |movie|
  json.id movie.id
  json.created_at l(movie.created_at, format: :default)
  json.name movie.name
  json.genre movie.genre.name
  json.poster_url movie.poster_url_or_fallback
end

json.genres Genre.all.each do |genre|
  json.id genre.id
  json.name genre.name
end

json.partial! partial: '/api/admin/shared/pagination', locals: {
  kind: @movies
}

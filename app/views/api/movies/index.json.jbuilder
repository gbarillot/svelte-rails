json.movies @movies.each do |movie|
  json.id movie.id
  json.created_at l(movie.created_at, format: :default)
  json.name movie.name
  json.genre t(movie.genre.name, scope: 'genres')
  json.poster_url movie.poster_url_or_fallback
end

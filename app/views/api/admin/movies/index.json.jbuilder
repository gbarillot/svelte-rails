json.movies @movies.each do |movie|
  json.id movie.id
  json.created_at l(movie.created_at, format: :default)
  json.name movie.name
  json.genre movie.genre.name
  json.poster_url movie.poster.present? ? ActiveStorage::Blob.service.path_for(movie.poster.key).split('/public').last : ''
end

json.genres Genre.all.each do |genre|
  json.id genre.id
  json.name genre.name
end

json.partial! partial: '/api/admin/shared/pagination', locals: {
  kind: @movies
}

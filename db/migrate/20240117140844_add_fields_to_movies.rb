class AddFieldsToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :released_at, :date 
    add_column :movies, :restricted, :boolean, default: false
  end
end

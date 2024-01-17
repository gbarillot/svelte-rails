class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.timestamps
      t.string :name
      t.text :description 
      t.integer :genre_id
      t.integer :rating
    end

    create_table :genres do |t|
      t.timestamps
      t.string :name
    end
  end
end

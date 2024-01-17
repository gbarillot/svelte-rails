class Movie < ApplicationRecord
  paginates_per 5

  validates_presence_of :name, :description

  belongs_to :genre
end

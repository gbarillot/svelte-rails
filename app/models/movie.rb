class Movie < ApplicationRecord
  include Attachable
  paginates_per 5

  validates_presence_of :name, :description

  has_one_attached :poster
  belongs_to :genre
end

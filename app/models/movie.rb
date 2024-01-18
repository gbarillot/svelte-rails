class Movie < ApplicationRecord
  include Attachable
  paginates_per 5

  validates_presence_of :name, :description

  has_one_attached :poster
  belongs_to :genre
  
  POSTER_FALLBACK = '/no_image.jpg'.freeze

  def handle_poster(attachment)
    if attachment.nil?
      self.poster.purge 
    else
      self.attach_file!(attachment, :poster)
    end
  end 

  def poster_url 
    # A bit hacky but I use /public as a storage for this demo, which is hacky in itself
    # Use a real 3rd party storage for real world use
    poster.present? ? ActiveStorage::Blob.service.path_for(poster.key).split('/public').last : ''
  end

  def poster_url_or_fallback
    poster.present? ? poster_url : POSTER_FALLBACK
  end

  private 

  def self.ransackable_attributes(auth_object = nil)
    ["name", "genre_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["genre"]
  end
end

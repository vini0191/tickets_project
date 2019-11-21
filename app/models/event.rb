class Event < ApplicationRecord
  has_many :tickets, dependent: :destroy
  has_many :users, through: :tickets

  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end

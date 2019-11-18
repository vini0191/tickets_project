class Event < ApplicationRecord
  has_many :tickets, dependent: :destroy
  has_many :users, through: :tickets
end

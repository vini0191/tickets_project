class Trade < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates :status, inclusion: { in: ['confirmation pending', 'confirmed'] }
end

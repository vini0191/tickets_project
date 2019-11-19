class Trade < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates :ticket, :user, uniqueness: true
  validates :status, inclusion: { in: ['confirmation pending', 'confirmed'] }
end

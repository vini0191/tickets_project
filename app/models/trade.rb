class Trade < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates :status, inclusion: { in: %w['confirmation pending' confirmed] }
end

class Trade < ApplicationRecord
  belongs_to :ticket
  belongs_to :user
  has_one :review

  validates :user_id, uniqueness: {
    scope: :ticket_id,
    message: "Transaction already done"
  }

  validates :status, inclusion: { in: ['confirmation pending', 'confirmed'] }
end

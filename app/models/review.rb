class Review < ApplicationRecord
  belongs_to :user
  belongs_to :trade

  validates :user_id, uniqueness: {
    scope: :trade_id,
    message: "Rate already done"
  }

  validates :rate, inclusion: { in: (1..5).to_a }
end

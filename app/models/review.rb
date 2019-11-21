class Review < ApplicationRecord
  belongs_to :user
  belongs_to :trade

  validates :user_id, uniqueness: {
    scope: :trade_id,
    message: "Rate already done"
  }

end

class AddDefaultToRate < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :rate, :integer, default: 0
  end
end

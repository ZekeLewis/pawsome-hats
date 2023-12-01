class AddIsTradeToHats < ActiveRecord::Migration[7.0]
  def change
    add_column :hats, :is_trade, :boolean
  end
end

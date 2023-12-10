class AddQuantityToHats < ActiveRecord::Migration[7.0]
  def change
    add_column :hats, :quantity, :integer
  end
end

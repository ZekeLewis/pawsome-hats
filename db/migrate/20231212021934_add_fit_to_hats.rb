class AddFitToHats < ActiveRecord::Migration[7.0]
  def change
    add_column :hats, :fit, :string
    add_column :hats, :string, :string
  end
end

class AddDetailsToHats < ActiveRecord::Migration[7.0]
  def change
    add_column :hats, :colour, :string
    add_column :hats, :material, :string
  end
end

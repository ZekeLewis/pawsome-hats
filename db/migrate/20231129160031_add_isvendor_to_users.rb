class AddIsvendorToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :isvendor, :string
  end
end

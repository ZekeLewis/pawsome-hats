class AddUserIdToHats < ActiveRecord::Migration[7.0]
  def change
    add_column :hats, :user_id, :integer
  end
end

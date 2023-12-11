class AddShippingInfoToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :shipping_name, :string
    add_column :orders, :shipping_address, :string
    add_column :orders, :shipping_city, :string
    add_column :orders, :shipping_state, :string
    add_column :orders, :shipping_zip, :string
    add_column :orders, :shipping_country, :string
  end
end

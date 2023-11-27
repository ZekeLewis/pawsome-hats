# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint           not null
#  hat_id     :bigint           not null
#
# Indexes
#
#  index_cart_items_on_cart_id  (cart_id)
#  index_cart_items_on_hat_id   (hat_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (hat_id => hats.id)
#
class CartItem < ApplicationRecord
  belongs_to(
    :cart,
    class_name: 'Cart',
    foreign_key: 'cart_id',
    inverse_of: :cart_items
  )
 
  belongs_to(
    :hat,
    class_name: 'Hat',
    foreign_key: 'hat_id',
    inverse_of: :cart_items
  )
end

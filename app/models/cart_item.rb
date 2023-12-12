# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(1)
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
  belongs_to :cart
  belongs_to :hat

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

end

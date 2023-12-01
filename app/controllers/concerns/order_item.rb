# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  hat_id     :bigint           not null
#  order_id   :bigint           not null
#
# Indexes
#
#  index_order_items_on_hat_id    (hat_id)
#  index_order_items_on_order_id  (order_id)
#
# Foreign Keys
#
#  fk_rails_...  (hat_id => hats.id)
#  fk_rails_...  (order_id => orders.id)
#
class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :hat
    
  end

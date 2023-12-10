# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  shipping_address :string
#  shipping_city    :string
#  shipping_country :string
#  shipping_name    :string
#  shipping_state   :string
#  shipping_zip     :string
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint           not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items, dependent: :destroy
    has_many :hats, through: :order_items

    before_create :set_default_status

    after_create :decrease_hat_quantities

    private
  
    def decrease_hat_quantities
      order_items.each do |item|
        item.hat.decrement!(:quantity, item.quantity) if item.hat.quantity.present?
      end
    end

  

  def set_default_status
    self.status ||= 'pending'
  end
end

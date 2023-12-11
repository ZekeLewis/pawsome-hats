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
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

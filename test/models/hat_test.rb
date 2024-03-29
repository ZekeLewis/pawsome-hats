# == Schema Information
#
# Table name: hats
#
#  id          :bigint           not null, primary key
#  category    :string
#  colour      :string
#  description :text
#  fit         :string
#  image       :binary
#  is_trade    :boolean
#  material    :string
#  price       :decimal(, )
#  quantity    :integer
#  string      :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cart_id     :bigint
#  user_id     :integer
#
# Indexes
#
#  index_hats_on_cart_id  (cart_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#
require "test_helper"

class HatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

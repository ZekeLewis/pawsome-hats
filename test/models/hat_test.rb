# == Schema Information
#
# Table name: hats
#
#  id          :bigint           not null, primary key
#  category    :string
#  colour      :string
#  description :text
#  image       :binary
#  is_trade    :boolean
#  material    :string
#  price       :decimal(, )
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cart_id     :bigint
#
# Indexes
#
#  index_hats_on_cart_id  (cart_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#
<<<<<<< HEAD
#  material    :string
=======
#  is_trade    :boolean
>>>>>>> cda83f03fc9d212f657ef9cb3452c90dc31a8d2a
#  price       :decimal(, )
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cart_id     :bigint
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

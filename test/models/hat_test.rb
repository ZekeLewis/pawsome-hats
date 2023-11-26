# == Schema Information
#
# Table name: hats
#
#  id          :bigint           not null, primary key
#  category    :string
#  description :text
#  image       :binary
#  price       :decimal(, )
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class HatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

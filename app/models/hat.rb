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
class Hat < ApplicationRecord
    has_one_attached :image, :dependent => :destroy
end

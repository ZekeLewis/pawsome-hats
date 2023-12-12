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
class Hat < ApplicationRecord
  has_one_attached :image, :dependent => :destroy
 # belongs_to :user

  has_many(
      :cart_items,
      class_name: 'CartItem',
      foreign_key: 'hat_id',
      inverse_of: :hat,
      dependent: :destroy
    )
   
    has_many :carts, through: :cart_items
    validates :title, :description, :price, presence: true
end

# == Schema Information
#
# Table name: feedbacks
#
#  id         :bigint           not null, primary key
#  category   :string
#  details    :text
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Feedback < ApplicationRecord
    validates :rating, presence: true
    validates :category, presence: true
    
end


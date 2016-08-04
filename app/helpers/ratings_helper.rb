# == Schema Information
#
# Table name: ratings
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  recipe_id           :integer
#  taste               :float
#  ease_of_preparation :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  comment             :text
#

module RatingsHelper
end

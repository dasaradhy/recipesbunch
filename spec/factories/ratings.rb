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

FactoryGirl.define do
  factory :rating do
    user
    recipe
    taste 1.5
    ease_of_preparation 1.5
  end
end

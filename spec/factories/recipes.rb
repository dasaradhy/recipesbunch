# == Schema Information
#
# Table name: recipes
#
#  id                  :integer          not null, primary key
#  chef_id             :integer
#  ingredients         :json
#  steps               :json
#  preparation_time    :string
#  ease_of_preparation :float
#  taste               :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryGirl.define do
  factory :recipe do
    chef
    ingredients {{"ingredients":["Oil","Cloves","Garlic","Bay Leaves","Salt to taste","Pepper to taste"]}}
    steps {{"steps":[{"description":"Heat oil","image":"one.png"},{"description":"Add Stuff","image":"two.png"},{"description":"Its done!","image":"three.png"}]}}
    preparation_time "15 minutes"
    ease_of_preparation 2.5
    taste 2.5
  end
end

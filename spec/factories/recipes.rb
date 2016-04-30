# == Schema Information
#
# Table name: recipes
#
#  id                  :integer          not null, primary key
#  chef_id             :integer
#  ingredients         :json             default([])
#  steps               :json             default([])
#  preparation_time    :string
#  ease_of_preparation :float
#  taste               :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  name                :string
#  images              :json             default([])
#

FactoryGirl.define do
  factory :recipe do
    chef
    name 'Yummy recipe!'
    ingredients ["Oil","Cloves","Garlic","Bay Leaves","Salt to taste","Pepper to taste"]
    steps ["<p>This is the first step..</p><p><img class=\"processed\" src=\"/uploads/media/open-uri20160417-4283-1vu6weh.png\"><br></p>",
      "<p>This is the next step..</p><p>This is what you should do</p><p>blah.. blah..</p><p>Great!</p><p><img class=\"processed\" src=\"/uploads/media/open-uri20160417-4283-1j0v2st.png\"><br></p>"]
    preparation_time "15 minutes"
    ease_of_preparation 3.5
    taste 2.5
    images []
    description 'This is a test recipe. This is there for testing..'
  end
end

# == Schema Information
#
# Table name: recipes
#
#  id                  :integer          not null, primary key
#  chef_id             :integer
#  ingredients         :json             default([])
#  steps               :json
#  preparation_time    :string
#  ease_of_preparation :float
#  taste               :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  name                :string
#  images              :json
#

module RecipesHelper
end

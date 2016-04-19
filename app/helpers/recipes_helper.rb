# == Schema Information
#
# Table name: recipes
#
#  id               :integer          not null, primary key
#  chef_id          :integer
#  ingredients      :json             default([])
#  steps            :json             default([])
#  preparation_time :string
#  difficulty       :float
#  taste            :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  name             :string
#  images           :json             default([])
#

module RecipesHelper
end

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

require 'rails_helper'

RSpec.describe Rating, type: :model do
  
  it 'has a valid factory' do
    expect(create(:rating)).to be_valid
  end

  it 'should always have a user' do
    expect(build(:rating, user:nil)).not_to  be_valid
  end

  it 'should always have a recipe' do
    expect(build(:rating, recipe:nil)).not_to  be_valid
  end

  it 'should have a non-zero rating for taste' do
    expect(build(:rating, taste: 0)).not_to be_valid
  end

  it 'should have a non-zero rating for ease_of_preparation' do
    expect(build(:rating, ease_of_preparation: 0)).not_to be_valid
  end

  it 'should be unique for a user/recipe' do
    user = create(:user)
    recipe = create(:recipe)
    rating = create(:rating, user_id:user.id,recipe_id:recipe.id)
    duplicate = build(:rating, user_id:user.id,recipe_id:recipe.id)
    duplicate.valid?
    expect(duplicate.errors.full_messages).to include('Recipe Another rating already exists for this recipe/user.')
  end

end

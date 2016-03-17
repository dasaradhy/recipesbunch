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

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  
  it 'has a valid factory' do
    expect(create(:recipe)).to be_valid
  end

  it 'is invalid without any ingredients' do
    expect(build(:recipe, ingredients:nil)).not_to  be_valid
  end

  it 'is invalid without any steps' do
    expect(build(:recipe, steps:nil)).not_to  be_valid
  end

  it 'is invalid without a preparation_time' do
    expect(build(:recipe,preparation_time: nil)).not_to  be_valid
  end

  it 'is invalid without a valid preparation_time' do
    expect(build(:recipe,preparation_time: 'A few minutes')).not_to be_valid
  end

  it 'is invalid without a chef' do
    expect(build(:recipe,chef: nil)).not_to be_valid
  end


end

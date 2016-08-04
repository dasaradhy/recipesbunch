# == Schema Information
#
# Table name: recipes
#
#  id                  :integer          not null, primary key
#  chef_id             :integer
#  ingredients         :json             default([])
#  steps               :json             default([])
#  preparation_time    :string
#  ease_of_preparation :float            default(0.0)
#  taste               :float            default(0.0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  name                :string
#  images              :json             default([])
#  description         :text
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

  it 'is invalid without a name' do
    expect(build(:recipe,name: nil)).not_to be_valid
  end

  it 'is invalid with only whitespace characters' do
    expect(build(:recipe,steps:["     \n     "])).not_to be_valid
  end

  it 'is invalid with only <p> and <br> elements' do
    expect(build(:recipe,steps:["<p><br/></p>"])).not_to be_valid
  end

  it 'is invalid without a description' do
    expect(build(:recipe,description: nil)).not_to be_valid
  end

end

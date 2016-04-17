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

class Recipe < ActiveRecord::Base
  TIMES = ['5 minutes','10 minutes','15 minutes','20 minutes','30 minutes','45 minutes','1 hour','1:15 hours','1:30 hours','2:00 hours']
  belongs_to :chef
  validates_presence_of :name,:chef,:ingredients,:steps,:preparation_time
  validate :preparation_time_is_valid
  validate :ingredients_are_present
  validate :steps_are_present


  private
  def preparation_time_is_valid
    errors.add(:preparation_time,'should be a valid time') unless TIMES.include?(preparation_time)
  end

  def ingredients_are_present
    errors.add(:ingredients,'Ingredients should not be empty') unless (ingredients.present? && ingredients.any?{|ingredient|ingredient.present?})
  end

  def steps_are_present
    errors.add(:steps,'Steps should not be empty') unless (steps.present? && steps.any?{|step|step.present?})
  end

end

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

class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates :user,:recipe, presence: true
  validate :user_recipe_uniqness
  validates_each :taste, :ease_of_preparation do |rec,attr,val| 
    rec.errors.add(attr,'must be non-zero.') unless val.present? && val>0
  end

  private
  def user_recipe_uniqness
    if Rating.where(user:self.user,recipe:self.recipe).where('id!=?',self.id.to_i).present?
      errors.add(:recipe,'Another rating already exists for this recipe/user.') 
    end
  end
end

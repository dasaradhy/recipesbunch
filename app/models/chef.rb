# == Schema Information
#
# Table name: chefs
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  recommendations :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Chef < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :recipes
end

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

class Recipe < ActiveRecord::Base
  TIMES = ['5 minutes','10 minutes','15 minutes','20 minutes','30 minutes','45 minutes','1 hour','1:15 hours','1:30 hours','2:00 hours']
  belongs_to :chef
end

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

FactoryGirl.define do
  factory :chef do
    user
  end
end

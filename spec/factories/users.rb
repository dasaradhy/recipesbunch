# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  firstname              :string
#  lastname               :string
#  nickname               :string
#  provider               :string
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

FactoryGirl.define do
  factory :user do
    firstname {Faker::Name.first_name}
    lastname {Faker::Name.last_name}
    nickname {Faker::Name.first_name}
    provider "MyString"
    uid "MyString"
    email { Faker::Internet.email }
    password "test1234"
    password_confirmation "test1234"
    after(:create) do |user|
      user.chef=Chef.new
      user.chef.user=user
    end
  end
end

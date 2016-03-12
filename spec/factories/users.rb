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
  end
end

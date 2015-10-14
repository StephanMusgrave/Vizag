# spec/factories/users.rb
#
# Author::   Steve Musgrave  (mailto:stephan.musgrave@gmail.com)

FactoryGirl.define do

  factory :customer, class: User do
    first_name 'Customer'
    last_name 'Test'
    email 'customer@test.com'
    password '12345678'
    password_confirmation '12345678'
    has_manager false
  end

  factory :manager, class: User do
    first_name 'Manager'
    last_name 'Test'
    email 'manager@test.com'
    password '12345678'
    password_confirmation '12345678'
    has_manager true
  end

  factory :fake_user, class: User do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end

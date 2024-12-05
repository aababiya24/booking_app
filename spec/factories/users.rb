FactoryBot.define do
  factory :user do
   
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { "name@gmail.com" }
    password { "password" }
    password_confirmation { "password" }
   

  end
end

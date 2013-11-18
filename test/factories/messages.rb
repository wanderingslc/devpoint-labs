# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    body        { Faker::Lorem.paragraph }
    email       { Faker::Internet.email } 
    name        { Faker::Name.name }
    subject     { Faker::Lorem.sentence }
  end
end

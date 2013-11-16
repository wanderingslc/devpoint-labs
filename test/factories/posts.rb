# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title                 { Faker::Lorem.word }
    body                  { Faker::Lorem.paragraph }
    published_at          { Time.now }
    seo_title             { Faker::Lorem.sentence }
    seo_description       { Faker::Lorem.sentence }
  end
end

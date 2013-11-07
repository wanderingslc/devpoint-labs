# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    caption { Faker::HipsterIpsum.word }
    description { Faker::HipsterIpsum.phrase }
    image { File.open(Dir["/Users/ben/Pictures/Stock\ Photos/wallpapers/*.jpg"].sample) }
  end
end

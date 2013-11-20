# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    caption { Faker::HipsterIpsum.word }
    description { Faker::HipsterIpsum.phrase }
    image { Rack::Test::UploadedFile.new(Rails.root.join("#{Rails.root}/app/assets/images/avatars/default/original.png"), 'image/png') }
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gallery_image do
    caption "MyString"
    description "MyText"
    projects nil
  end
end

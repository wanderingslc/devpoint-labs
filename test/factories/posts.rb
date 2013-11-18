# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    body "MyText"
    published_at "2013-10-29 17:25:49"
    user nil
    seo_title "MyString"
    seo_description "MyString"
  end
end

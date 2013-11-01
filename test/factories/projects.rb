# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name            { Faker::Lorem.sentence }
    description     { Faker::Lorem.paragraph }
    url             {Faker::Internet.http_url}
    completed_at    {Time.now - 10.weeks}
    published_at    {Time.now - 20.minutes}
    stats           { Faker::Lorem.sentence }
    # user_id         { FactoryGirl.create(:user).id}
  end
end

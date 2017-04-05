FactoryGirl.define do
  
  sequence :short_url do |n|
    "https://ruby-learning-benjcarson.c9users.io/#{n}"
  end
  
  factory :url do
    original_url { Faker::Internet.url }
    short_url
  end
end

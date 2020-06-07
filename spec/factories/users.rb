FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { 'password' }
    username { Faker::Name.unique.name }
    image_url { 'https://fakeimg.pl/300/' }
  end
end

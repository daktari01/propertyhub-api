FactoryBot.define do
  factory :property do
    name { Faker::Address.street_address }
    location { Faker::Address.full_address }
    price { Faker::Commerce.price }
    rent_sale { ['rent'] }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    image_urls { ['https://fakeimg.pl/300/', 'https://fakeimg.pl/250x100/'] }
    user
  end
end

FactoryBot.define do
  factory :property do
    name { Faker::Address.street_address }
    property_type { 'residential' }
    location { Faker::Address.full_address }
    price { Faker::Commerce.price }
    rent_sale { ['rent'] }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    image_urls { ['https://fakeimg.pl/300/', 'https://fakeimg.pl/250x100/'] }
    user
    trait :commercial do
      property_type { 'commercial' }
      price_per_sqfoot { Faker::Commerce.price }
    end
    trait :land do
      property_type { 'land' }
      size { Faker::Number.between(from: 1, to: 1000) }
    end
  end
end

FactoryBot.define do
  factory :property do
    name { Faker::Address.street_address }
    location { Faker::Address.full_address }
    price { Faker::Commerce.price }
    rent_sale { 'rent' }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    user
  end
end

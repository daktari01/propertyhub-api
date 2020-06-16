class Api::V1::PropertySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :property_type, :name, :location, :price,
             :price_per_sqfoot, :size, :rent_sale, :description,
             :image_urls, :beds, :baths
end

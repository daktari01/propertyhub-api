class Property < ApplicationRecord
  belongs_to :user
  validates :name, :location, :price, :rent_sale, :description, :image_urls, presence: true
end

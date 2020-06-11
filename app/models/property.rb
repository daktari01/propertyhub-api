class Property < ApplicationRecord
  belongs_to :user
  validates :name, :location, :price, :rent_sale, :description, :image_urls, :property_type, presence: true
  validates :property_type, inclusion: { in: %w(residential commercial land) }
  validates :size, presence: true, if: Proc.new { |m| m.property_type.in?(['land']) }
  validates :price_per_sqfoot, presence: true, if: Proc.new { |m| m.property_type.in?(['commercial']) }
end

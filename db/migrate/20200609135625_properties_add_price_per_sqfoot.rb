class PropertiesAddPricePerSqfoot < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :price_per_sqfoot, :decimal
  end
end

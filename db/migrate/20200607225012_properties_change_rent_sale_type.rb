class PropertiesChangeRentSaleType < ActiveRecord::Migration[6.0]
  def change
    change_column :properties, :rent_sale, "varchar[] USING (string_to_array(rent_sale, ','))"
  end
end

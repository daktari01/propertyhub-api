class PropertiesChangeImageUrlType < ActiveRecord::Migration[6.0]
  def change
    change_column :properties, :image_url, "varchar[] USING (string_to_array(image_url, ','))"
  end
end

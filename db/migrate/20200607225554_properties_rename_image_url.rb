class PropertiesRenameImageUrl < ActiveRecord::Migration[6.0]
  def change
    rename_column :properties, :image_url, :image_urls
  end
end

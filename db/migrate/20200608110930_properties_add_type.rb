class PropertiesAddType < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :property_type, :string, :null=>false
    add_column :properties, :size, :decimal
    add_column :properties, :beds, :integer
    add_column :properties, :baths, :integer
  end
end

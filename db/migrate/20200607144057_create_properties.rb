class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :location
      t.decimal :price
      t.string :rent_sale
      t.text :description

      t.timestamps
    end
  end
end

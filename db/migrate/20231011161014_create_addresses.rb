class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|

      t.integer :delivery_country_id, null: false
      t.string :postal_code, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :telephone_number, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end

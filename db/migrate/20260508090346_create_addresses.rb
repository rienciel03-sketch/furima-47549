class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :postcode,         null: false
      t.integer :prefecture,      null: false
      t.string :municipality
      t.string :address
      t.string :building_name
      t.string :phone_number
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end

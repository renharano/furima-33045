class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      
      t.string :post_code, null: false
      t.integer :prefecture_id, nill: false
      t.string :city, nill: false
      t.string :address, nill: false
      t.string :building_name
      t.string :phone_number, nill: false
      t.references :order, nill: false, foreign_key: true
      t.timestamps
    end
  end
end
class CreateSendingDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :sending_destinations do |t|
      t.string :destination_first_name,              null: false, default: ""
      t.string :destination_family_name,              null: false, default: ""
      t.string :destination_first_name_kana,              null: false, default: ""
      t.string :destination_family_name_kana,              null: false, default: ""
      t.integer :post_code,              null: false
      t.integer :prefecture_name,              null: false
      t.string :City,              null: false
      t.string :address,              null: false
      t.string :building_name
      t.string :phone_number
      t.references :user, foreign_key: true
      t.timestamps
    end
    add_index :sending_destinations, :phone_number, unique: true
  end
end

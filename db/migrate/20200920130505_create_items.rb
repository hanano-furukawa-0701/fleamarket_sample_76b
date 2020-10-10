class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,              null: false
      t.text :explanation,              null: false
      t.references :category,foreign_key: true
      t.string :brand
      t.string :size
      t.integer :condition_id,              null: false
      t.string :prefecture_id,              null: false
      t.string :payer_id,              null: false
      t.string :preparation_day_id,              null: false
      t.integer :price
      t.references :user,foreign_key: true
      t.timestamps
    end
  end
end

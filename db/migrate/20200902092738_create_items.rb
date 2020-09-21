class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      # t.references :category, foreign_key: true
      t.integer :condition_id
      t.string :prefecture_id
      t.string :payer_id
      t.string :preparation_day_id
      t.integer :price
      t.references :user,foreign_key: true
      t.timestamps
    end
  end
end

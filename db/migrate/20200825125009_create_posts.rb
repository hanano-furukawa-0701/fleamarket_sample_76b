class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :name,null:false
      t.text :introduction,null:false
      t.integer :price,null:false
      t.references :brand_id,null:false,foreign_key:true
      t.references :item_conditions_id,null:false,foreign_key:true
      t.references :category_id,null:foreign_key:true
      t.references :seller_id,null:false,foreign_key:true
      t.references :buyer_id,null:false,foreign_key:true
      t.timestamps :deal_closed_date
    end
  end
end

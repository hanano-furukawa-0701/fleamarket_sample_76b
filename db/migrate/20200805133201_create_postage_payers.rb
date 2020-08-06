class CreatePostagePayers < ActiveRecord::Migration[5.2]
  def change
    create_table :postage_payers do |t|
      t.string :postage_payers, :null => false
      t.timestamps
    end
  end
end

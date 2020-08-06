class CreateSnsAuthentifications < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_authentifications do |t|
      t.string :provider, :null => false
      t.string :uid, :null => false
      t.text :user_id
      t.timestamps
    end
  end
end

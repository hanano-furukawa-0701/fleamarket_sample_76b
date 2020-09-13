class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      # 消す必要がある？
      t.timestamps
    end
  end
end

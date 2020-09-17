class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
# 消す必要がある？
      t.timestamps
    end
  end
end

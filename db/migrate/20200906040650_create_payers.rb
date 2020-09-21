class CreatePayers < ActiveRecord::Migration[5.2]
  def change
    create_table :payers do |t|

      t.timestamps
    end
  end
end

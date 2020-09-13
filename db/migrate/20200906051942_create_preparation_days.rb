class CreatePreparationDays < ActiveRecord::Migration[5.2]
  def change
    create_table :preparation_days do |t|

      t.timestamps
    end
  end
end

class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.string :evaluation, :null =>false
      t.timestamps
    end
  end
end

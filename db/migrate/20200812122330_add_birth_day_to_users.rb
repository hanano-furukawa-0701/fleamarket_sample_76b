class AddBirthDayToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Birth_day, :date
  end
end

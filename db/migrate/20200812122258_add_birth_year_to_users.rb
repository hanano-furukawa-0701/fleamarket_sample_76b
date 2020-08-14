class AddBirthYearToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Birth_year, :date
  end
end

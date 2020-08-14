class AddFirstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :First_name, :string
  end
end

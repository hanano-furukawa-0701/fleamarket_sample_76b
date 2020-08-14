class AddFamilyNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Family_name, :string
  end
end

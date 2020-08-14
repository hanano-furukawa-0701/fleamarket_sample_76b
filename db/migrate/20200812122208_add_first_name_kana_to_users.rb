class AddFirstNameKanaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :First_name_kana, :string
  end
end

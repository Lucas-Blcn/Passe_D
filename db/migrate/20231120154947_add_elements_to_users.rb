class AddElementsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pseudo, :string
    add_column :users, :phone_number, :string
  end
end

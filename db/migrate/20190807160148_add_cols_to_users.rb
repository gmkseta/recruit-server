class AddColsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false
    add_column :users, :phone, :string
    add_column :users, :image, :string
  end
end

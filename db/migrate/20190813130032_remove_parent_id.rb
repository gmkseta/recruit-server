
class RemoveParentId < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :parent_id
  end
end

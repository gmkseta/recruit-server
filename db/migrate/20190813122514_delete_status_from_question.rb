class DeleteStatusFromQuestion < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :status
  end
end

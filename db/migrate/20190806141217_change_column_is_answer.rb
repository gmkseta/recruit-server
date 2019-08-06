class ChangeColumnIsAnswer < ActiveRecord::Migration[5.2]
  def change
    change_column :questions, :is_answer, :tinyint, :limit => 1
  end
end

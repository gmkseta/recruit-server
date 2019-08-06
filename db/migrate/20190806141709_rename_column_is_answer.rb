class RenameColumnIsAnswer < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :is_answer, :status
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end

class RenameColumnFormSheetId < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :form_sheet_id
    add_reference :questions, :question_sheet, index: true
  end
end

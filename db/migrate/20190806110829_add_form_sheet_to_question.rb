class AddFormSheetToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :form_sheet, foreign_key: true

  end
end

class ChangeModelName < ActiveRecord::Migration[5.2]
  def change
    rename_table "form_sheets", "question_sheets"

  end
end

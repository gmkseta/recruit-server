class AddColsToQuestionSheets < ActiveRecord::Migration[5.2]
  def change
    add_column :question_sheets, :start_date, :datetime
    add_column :question_sheets, :end_date, :datetime
  end
end

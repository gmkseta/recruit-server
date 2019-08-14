class CreateAnswerSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_sheets do |t|
      t.references :question_sheet, foreign_key: true
      t.integer :total_score, default: 0

      t.timestamps
    end
  end
end

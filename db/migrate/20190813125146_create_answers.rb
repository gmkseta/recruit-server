class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :answer_sheet, foreign_key: true
      t.references :question, foreign_key: true
      t.integer :answerable_id
      t.string :answerable_type

      t.timestamps
    end
  end
end

class CreateAnswerScores < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_scores do |t|
      t.integer :score
      t.float :additive_mean
      t.text :comment
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end

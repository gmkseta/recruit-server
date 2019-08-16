class AddSubScoreToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :sub_score, :integer, null: true
  end
end

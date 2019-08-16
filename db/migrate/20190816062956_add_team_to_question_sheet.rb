class AddTeamToQuestionSheet < ActiveRecord::Migration[5.2]
  def change
    add_reference :question_sheets, :team, foreign_key: true
  end
end

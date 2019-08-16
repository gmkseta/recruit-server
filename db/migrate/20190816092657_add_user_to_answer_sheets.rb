class AddUserToAnswerSheets < ActiveRecord::Migration[5.2]
  def change
    add_reference :answer_sheets, :user, foreign_key: true
  end
end

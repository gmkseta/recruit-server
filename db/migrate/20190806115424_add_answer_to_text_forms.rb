class AddAnswerToTextForms < ActiveRecord::Migration[5.2]
  def change
    add_column :text_forms, :answer, :text
  end
end

class CreateStringForms < ActiveRecord::Migration[5.2]
  def change
    create_table :string_forms do |t|
      t.string :answer

      t.timestamps
    end
  end
end

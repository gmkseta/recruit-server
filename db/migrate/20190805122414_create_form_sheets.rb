class CreateFormSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :form_sheets do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end

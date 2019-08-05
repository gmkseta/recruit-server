class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :questionable_id
      t.string :questionable_type

      t.timestamps
    end
  end
end

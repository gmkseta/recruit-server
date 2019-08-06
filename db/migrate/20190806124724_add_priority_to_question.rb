class AddPriorityToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :priority, :integer, default: 0
    add_column :questions, :content, :string
    remove_column :text_forms, :content
    
  end
end

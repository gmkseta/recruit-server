class AddParentIdToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :parent, index: true
  end
end

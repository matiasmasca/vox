class AddCategoryRefToSelectionProcess < ActiveRecord::Migration
  def change
    add_reference :categories, :selection_process, index: true
  end
end

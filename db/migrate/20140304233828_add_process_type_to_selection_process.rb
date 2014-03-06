class AddProcessTypeToSelectionProcess < ActiveRecord::Migration
  def up
    change_table :selection_process do |t|
      add_column :selection_process, :process_type_id, :integer
      add_index :selection_process, :process_type_id
    end
  end
 
  def down
    change_table :selection_process do |t|
      remove_column :selection_process, :process_type_id, :integer
      remove_index :selection_process, :process_type_id
    end
  end

end

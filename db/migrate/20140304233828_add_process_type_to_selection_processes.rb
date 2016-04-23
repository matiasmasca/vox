class AddProcessTypeToSelectionProcesses < ActiveRecord::Migration
  def up
    change_table :selection_processes do |t|
      add_column :selection_processes, :process_type_id, :integer
      add_index :selection_processes, :process_type_id
    end
  end
 
  def down
    change_table :selection_processes do |t|
      remove_column :selection_processes, :process_type_id, :integer
      remove_index :selection_processes, :process_type_id
    end
  end
end

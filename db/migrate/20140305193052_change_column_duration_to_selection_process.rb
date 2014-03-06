class ChangeColumnDurationToSelectionProcess < ActiveRecord::Migration
  def up
    change_table :selection_process do |t|
    	change_column :selection_process, :duration, :integer
    end
  end
 
  def down
    change_table :selection_process do |t|
    	change_column :selection_process, :duration, :string
    end
  end
end

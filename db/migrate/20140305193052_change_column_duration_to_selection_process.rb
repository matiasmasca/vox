class ChangeColumnDurationToSelectionProcesses < ActiveRecord::Migration
  def up
    change_table :selection_processes do |t|
    	#Para SQLite
      change_column :selection_processes, :duration, :integer
      #Para Postgres
      #change_column :selection_processes, :duration, 'integer USING CAST(duration AS integer)'
    end
  end
 
  def down
    change_table :selection_processes do |t|
    	change_column :selection_processes, :duration, :string
      #Para Postgres
      #change_column :selection_processes, :duration, 'string USING CAST(duration AS string)'
    end
  end
end

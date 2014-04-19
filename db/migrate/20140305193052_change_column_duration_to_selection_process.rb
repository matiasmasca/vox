class ChangeColumnDurationToSelectionProcess < ActiveRecord::Migration
  def up
    change_table :selection_process do |t|
    	#Para SQLite
      change_column :selection_process, :duration, :integer
      #Para Postgres
      #change_column :selection_process, :duration, 'integer USING CAST(duration AS integer)'
    end
  end
 
  def down
    change_table :selection_process do |t|
    	change_column :selection_process, :duration, :string
      #Para Postgres
      #change_column :selection_process, :duration, 'string USING CAST(duration AS string)'
    end
  end
end

class CreateVoterLists < ActiveRecord::Migration
  def change
    create_table :voter_lists do |t|
      t.references :user, index: true
      t.references :selection_process, index: true
      t.integer :estado

      t.timestamps
    end
  end
end

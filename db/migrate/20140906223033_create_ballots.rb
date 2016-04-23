class CreateBallots < ActiveRecord::Migration
  def change
    create_table :ballots do |t|
      t.references :selection_process, index: true
      t.references :category, index: true
      t.references :candidate, index: true
      t.string :digital_signature

      t.timestamps
    end
  end
end

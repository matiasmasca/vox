class CreateEmittedVotes < ActiveRecord::Migration
  def change
    create_table :emitted_votes do |t|
      t.references :user, index: true
      t.references :category, index: true
      t.timestamps
    end
  end
end

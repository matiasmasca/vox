class CreateCategories < ActiveRecord::Migration
    def up
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.integer :bench

      t.timestamps
  end
  def down
    drop_table :categories
  end
end

class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :description
      t.integer :bench

      t.timestamps
    end
  end
end

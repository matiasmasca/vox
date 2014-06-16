class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :bios
      t.string :url_image

      t.timestamps
    end
    
    add_reference :candidates, :category, index: true
  
    create_table :categories_candidates, id: false do |t|
      t.belongs_to :categories
      t.belongs_to :candidates
    end
  end
end

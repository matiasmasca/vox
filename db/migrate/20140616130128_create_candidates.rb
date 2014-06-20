class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :bios
      t.string :url_image

      t.timestamps
    end
    
    add_reference :candidates, :category, index: true
  
    create_table :candidates_categories, id: false do |t|
      t.integer :category_id
      t.integer :candidate_id
    end


  end
end

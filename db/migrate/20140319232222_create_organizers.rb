class CreateOrganizers < ActiveRecord::Migration
  def up
    create_table :organizers do |t|
      t.string :name
      t.string :address
      t.string :web
      t.string :email
      
      t.timestamps
    end
  end

  def down
  	drop_table :organizers
  end

end

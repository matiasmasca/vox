class AddLogoToOrganizers < ActiveRecord::Migration
  def up
    change_table :organizers do |t|
      add_column :organizers, :logo, :string
    end
  end
 
  def down
    change_table :organizers do |t|
      remove_column :organizers, :logo, :string
    end
  end
end

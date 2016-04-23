class AddUserToOrganizer < ActiveRecord::Migration
  def change
    add_reference :organizers, :user, index: true

    #Otra forma de agregar la clave foranea, puede ser
    #add_column :organizers, :user_id, :integer
    #add_index :organizer, :user_id
  end
end
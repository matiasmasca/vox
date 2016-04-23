class AddOrganizerToSelectionProcess < ActiveRecord::Migration
  def change
  	add_reference :selection_processes, :organizer, index: true
  end
end
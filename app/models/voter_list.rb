# encoding: utf-8
class VoterList < ActiveRecord::Base
  belongs_to :selection_process, autosave: true
  has_many :user, autosave: true

  validates :user_id, uniqueness: { scope: :selection_process_id, message: "ese usuario ya está agregado al padrón." }
  
  def is_enable?
      self.estado == 1
  end

  def is_voter?(current_selection_process)
  	self.selection_process.id == current_selection_process
  end

  def que_estado
  	#Estado: 1. = "aprobado", 2. = "pendiente", 3. "rechazado"
  	case self.estado
			when 1
				"abrobado"
			when 2
				"pendiente"
			when 3
				"rechazado"
	  	end
  end

    #t.integer  "user_id"
    #t.integer  "selection_process_id"
    #t.integer  "estado"
end

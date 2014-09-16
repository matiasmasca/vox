# encoding: utf-8
class SelectionProcess < ActiveRecord::Base
    #Asociaciones
    belongs_to :organizer, autosave: true
    has_many :category, autosave: true
    has_many :voter_list, autosave: true
    has_many :users, through: :voter_list
    has_many :ballot, through: :ballot

	#datos obligatorios
	validates :name_process, :place, presence: { message: "es un dato obligatorio."}
    validates :organizer_id, presence: { message: "es un dato obligatorio."}
	#longitud de datos
	validates :name_process, length: { in: 8..250, message: "debe ser entre 8 y 250 caracteres" }
	validates :place, length: { in: 8..250, message: "debe ser entre 8 y 250 caracteres" }, :allow_blank => true

    validates :duration, inclusion: { in: 1..365, message: "%{value} debe ser entre 1 y 365" }, :allow_blank => true, numericality: { only_integer: true }
	
	#datos unicos.
	validates :name_process, uniqueness: { message: "ya está siendo utilizado.", :case_sensitive => false }

	def type
		case self.process_type_id
			when 1
				"premio"
			when 2
				"certamen"
			when 3
				"votación"
	  	end
	end

	def is_owner?(user_id)
	  self.organizer.user_id == user_id 
	end

	def is_public?
		true
		#self.process_type_id like "public"
	end

    def is_elector?(current_user)
     usuario_elector = VoterList.find_by(selection_process_id: self.id, user_id: current_user.id)
     if usuario_elector && usuario_elector.estado == 1
    	true
     else
    	false
     end
    end

    def abrir_elecciones
    	self.state = "abierto"
    end

    def cerrar_elecciones
    	self.state = "cerrado"
    end

end

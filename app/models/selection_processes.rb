class SelectionProcesses < ActiveRecord::Base
	#datos obligatorios
	validates :name_process,:place, presence: true
	#longitud de datos
	validates :name_process, length: { in: 8..250 }
	validates :place, length: { in: 8..250 }

    validates :duration, inclusion: { in: 1..365, message: "%{value} debe ser entre 1 y 365" }, :allow_blank => true, numericality: { only_integer: true }
	#datos unicos.
	validates :name_process, uniqueness: { message: "ya esta ciendo utilizado.", :case_sensitive => false }
end

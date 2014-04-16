# encoding: utf-8
class SelectionProcesses < ActiveRecord::Base
	#datos obligatorios
	validates :name_process, :place, presence: { message: "es un dato obligatorio."}

	#longitud de datos
	validates :name_process, length: { in: 8..250, message: "debe ser entre 8 y 250 caracteres" }
	validates :place, length: { in: 8..250, message: "debe ser entre 8 y 250 caracteres" }, :allow_blank => true

    validates :duration, inclusion: { in: 1..365, message: "%{value} debe ser entre 1 y 365" }, :allow_blank => true, numericality: { only_integer: true }
	#datos unicos.
	validates :name_process, uniqueness: { message: "ya está siendo utilizado.", :case_sensitive => false }
end

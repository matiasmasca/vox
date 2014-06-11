# encoding: utf-8
class Category < ActiveRecord::Base
	belongs_to :selection_process

	#validaciones
	validates :name, :bench, :selection_process_id, presence: { message: "es un dato obligatorio."}

	#Datos numericos,
	validates :bench, :selection_process_id, numericality: { only_integer: true, greater_than: 0, less_than: 1000, message: "debe ser entre 1 y 999." }

	#Longitudes.
	validates :name, length: { in: 5..250, message: "debe tener entre 4 y 250 caracteres" }
	validates :description, length: { in: 5..250, message: "debe tener entre 4 y 250 caracteres" }, :allow_blank => true
	validates :bench, length: { in: 1..3, message: "debe ser entre 1 y 3 digitos" }
	
	#Unico
	validates :name, uniqueness: { scope: :selection_process_id, message: "ese nombre ya está siendo utilizado." }


end

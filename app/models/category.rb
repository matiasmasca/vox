# encoding: utf-8
class Category < ActiveRecord::Base
	belongs_to :selection_process, autosave: true
    has_many :candidate, autosave: true
	
	#validaciones
	validates :name, :bench, :selection_process_id, presence: { message: "es un dato obligatorio."}

	#Datos numericos,
	validates :bench, numericality: { only_integer: true, greater_than: 0, less_than: 1000, message: "debe ser entre 1 y 999." }
    validates :selection_process_id, numericality: { only_integer: true, greater_than: 0, less_than: 9223372036854775808, message: "debe ser entero y mayor que 0" }
	
	#Longitudes.
	validates :name, length: { in: 5..250, message: "debe tener entre 4 y 250 caracteres" }
	validates :description, length: { in: 5..250, message: "debe tener entre 4 y 250 caracteres" }, :allow_blank => true
	validates :bench, length: { in: 1..3, message: "debe ser entre 1 y 3 digitos" }
	
	#Unico
	validates :name, uniqueness: { scope: :selection_process_id, message: "ese nombre ya está siendo utilizado." }

	#Para saber si ya voto en esa categoria
	def already_vote?(user)
     @voto_categoria = EmittedVote.find_by(user_id: user, category_id: self.id )
     if @voto_categoria
        return true
     else
        return false
     end
 	end

    def porcentaje_categoria
     #Candidad de votantes proceso, con estado Aprobado!
	 cantidad_electores = VoterList.includes(:selection_process).where(selection_process_id: self.selection_process_id, estado: 1).count

 	#Cantidad de votos por categoria
     cantidad_votos = Ballot.all.where(category_id: self.id).count

	 #Y sacar la diferencia entre la cantidad de votos y los votantes por las categorias.
	  porcentaje_categoria = (cantidad_votos * 100) / cantidad_electores
    end
end

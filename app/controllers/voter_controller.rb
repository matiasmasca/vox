# encoding: utf-8
class VoterController < ApplicationController
	before_action :authenticate_user!
	
	def vote
		set_selection_process
		check_voter
		set_category

		#Antes de votar, debe controlar que ya no haya votado en esa categoria.

		@ballot = Ballot.new
	end

	def emitir_voto
     	@ballot = Ballot.new
		#registrar voto, en voleta.
		@voto = Ballot.create!(selection_process_id: @selection_process.id, category_id: @category.id, candidate_id: @candidate.id)
		#Marcar la categoria.
		@emitted_vote = EmittedVote.create!(user_id: current_user.id, category_id: @category.id)
		raise ''
	end

	def results
		#En futuras versiones, deberia guardar el resultado final en una tabla para ahorrar procesamiento. Una vez cerrado el proceso.	
		set_selection_process
		@candidatos = @selection_process.category.first.candidate.first

		recuento(@selection_process)
		porcentaje_avance
	end

	def porcentaje_avance
		#Candidad de votantes proceso, con estado Aprobado!
		@cantidad_electores = VoterList.includes(:selection_process).where(selection_process_id: @selection_process.id).count

		#Cantidad de votos
		@cantidad_votos = Ballot.all.where(selection_process_id: @selection_process.id).count

		#Cantidad de Categoria
		@cantidad_categorias = @selection_process.category.count

		#Multiplicar los votantes por la cantidad de categorias.
		@total_votos_teorico = @cantidad_electores * @cantidad_categorias
		#Y sacar la diferencia entre la cantidad de votos y los votantes por las categorias.
		@porcentaje_avance = (@cantidad_votos * 100) / @total_votos_teorico

	end


private
	def recuento(proceso)
		@recuento_proceso = {}
		proceso.category.each do |category|
			@recuento_proceso[category.id.to_s.to_sym] = recuento_categoria(category)
			puts("Recuento proceso: #{@recuento_proceso[:category]}" )
		end
		@recuento_proceso
	end

    def cantidad_votos(categoria, candidato)
    	votos = Ballot.all.where(category_id: categoria, candidate_id: candidato).count
    	puts("Votos candidato #{candidato}: #{votos}" )
    	return votos
    end

    def recuento_categoria(categoria)
	  @recuento_categoria = {}
      categoria.candidate.each do |candidate| 
	 	 #for candidato
	 	 #agregar a un hash candidato:votos
	 	 @recuento_categoria[candidate.id.to_s.to_sym] = cantidad_votos(categoria.id, candidate.id)
		end
	  puts("Recuento categoria: #{@recuento_categoria.inspect}")
	  return @recuento_categoria
	end

	


	def set_selection_process
		if user_session[:selection_process_id] ||  params[:selection_process_id] && !@selection_process
			selection_process =  user_session[:selection_process_id] if user_session[:selection_process_id] 
			selection_process = params[:selection_process_id] if params[:selection_process_id]
			@selection_process = SelectionProcess.find_by(id: selection_process)
			user_session[:selection_process_id] = @selection_process.id if @selection_process
		end
	end

	def set_category
		category_id = user_session[:voter_category_id] unless user_session[:voter_category_id].nil?
        category_id = params[:category_id] unless params[:category_id].nil?
		
        if category_id
          @category = Category.find_by_id(category_id)
          user_session[:voter_category_id] = @category.id unless @category.nil?
      	else
		  #@category = @selection_process.category.first
		  user_session[:voter_category_id] = nil
		  @category = nil
		end

		if @selection_process.category[0].nil?
			user_session[:voter_category_id] = nil
		  @category = nil
		end
	end

	def check_voter
		#Chequear si el usuario esta habilitado para votar en el proceso, en teoria sí. Pero igual chequear.
		# El Current_user, esta registrado en en voter_list del proceso.
		usuario_elector = VoterList.find_by(selection_process_id: @selection_process.id, user_id: current_user.id)
		
		unless usuario_elector
		  security_exit
		  return false
		end  

		case usuario_elector.estado
			when 2
			 #Aun no fuiste aprobado
			 redirect_to(:back, alert: "Aun no fuiste aprobado para votar por el organizador.")
             return false
			when 3
			 #fuiste rechazado
			 redirect_to(:back, alert: "Fuiste RECHAZADO para votar en este proceso por el organizador. Ante la duda contactate con él.")
             return false
		end

		unless current_user.id == usuario_elector.user_id
			security_exit
		end
	end

	def security_exit
        respond_to do |format|
        format.html do
           user_session[:organizer_id] =  nil
           user_session[:category_id] =  nil
           user_session[:selection_process_id] = nil

           redirect_to(root_path, alert: "Solo puedes votar en los procesos que hayas sido autorizado por el organizador. Si crees que es un error, contacta al organizador del evento.")
           return false
        end
      end
    end


end
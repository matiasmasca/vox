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

private
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
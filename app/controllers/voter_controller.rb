# encoding: utf-8
class VoterController < ApplicationController
	def vote
		set_selection_process
		set_category
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
		if user_session[:category_id] || params[:category_id]
			params[:category_id] ||= user_session[:category_id]
			@category = Category.find_by(id: params[:category_id])
		else
			@category = @selection_process.category.first
		end	
	end

end
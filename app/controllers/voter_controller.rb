# encoding: utf-8
class VoterController < ApplicationController
	def vote
		@selection_process = SelectionProcess.find_by(id: user_session[:selection_process_id])
		set_category
	end

	def set_category
		if user_session[:category_id] || params[:category_id]
			category ||= user_session[:category_id] && params[:category_id]
			@category = Category.find_by(id: category)
		else
			@category = @selection_process.category.first
		end

		#raise ''		
	end

end
class JoinsController < ApplicationController
	def create
		Join.create(user_id: params[:user_id], event_id: params[:event_id])
		redirect_to :back
	end

	def destroy
		@join = Join.where(user_id: params[:user_id], event_id: params[:id])
		Join.destroy(@join)
	end
end
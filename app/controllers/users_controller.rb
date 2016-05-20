class UsersController < ApplicationController
before_action :require_login, except: [:new, :create]
before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def create
  	new_user = User.create(user_params)
  	if new_user.save
  		redirect_to "/events"
  	else
  		redirect_to "/sessions/new"
  		flash[:errors] = new_user.errors.full_messages
  	end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
  	end
end
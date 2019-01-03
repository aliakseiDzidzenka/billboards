class UsersController < ApplicationController

	before_action :authenticate_user!, :except => [:show]
	

	def index
		if current_user.admin? == true
      @users = User.all
    else
    	redirect_to root_path, alert: 'Admins only'
    end
	end

	def show
		@user = User.find(params[:id])
	end


end

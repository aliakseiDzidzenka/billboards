class BillboardsController < ApplicationController
	
	before_action :authenticate_user!, :except => [:show, :index]

	def index
		@billboards = Billboard.all
	end

	def show
		@billboard = Billboard.find(params[:id])
		
	end

	def new
		# auth_admin
		if current_user.admin
			@billboard = Billboard.new
		else
			redirect_to root_path
		end
	end

	def create

		if current_user.admin
		  @billboard = Billboard.new(billboard_params)

		  if @billboard.save
			  redirect_to billboard_path(@billboard)
		  else 
			  redirect_to root_path
		  end
		else
			redirect_to root_path
		end

	end

	private 
	def billboard_params
		params.require(:billboard).permit(:city, :street, :house, :price).merge(user_id: current_user.id)
		#user_id: current_user.id
	end

	def auth_admin
		redirect_to root_path if current_user.admin == false
	end

end

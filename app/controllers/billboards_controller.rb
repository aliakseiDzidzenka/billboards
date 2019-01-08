class BillboardsController < ApplicationController
	
  @@show_free = false



	before_action :authenticate_user!, :except => [:show, :index]

	
	def index
		#@billboards = Billboard.all
		if @@show_free == true
			@billboards = Billboard.all.where('id NOT IN (?)', Rent.where(:is_active? == true).where('start <= ?', DateTime.now.beginning_of_day).select(:board_id))
		else
		  @billboards = Billboard.all
		end
	end

	def free
		redirect_to billboards_path
	  @billboards = Billboard.all.where('id NOT IN (?)', Rent.where(:is_active? == true).where('start <= ?', DateTime.now.beginning_of_day).select(:board_id))

	end

	def show
		@billboard = Billboard.find(params[:id])
		@request = Request.new
		@requests = @billboard.requests
		
	end

	def new
		auth_admin
		#if current_user.admin
			@billboard = Billboard.new
		#session[:billboard_params] ||= {}

		#else
		#	redirect_to root_path
		#end
	end

	def create

	auth_admin
		#if current_user.admin
		  @billboard = Billboard.new(billboard_params)

		  if @billboard.save
			  redirect_to billboard_path(@billboard)
		  else 
			  redirect_to root_path
		  end
		#else
		#	redirect_to root_path
		#end



	end

	def edit
		@billboard = Billboard.find(params[:id])
	end

	def update
		@billboard = Billboard.find(params[:id])
		@billboard.update(billboard_params)
		redirect_to billboard_path(@billboard)
	end

def button
		@@show_free = !@@show_free
    redirect_to billboards_path
  end

	private 
	def billboard_params
		params.require(:billboard).permit(:city, :street, :house, :price, :image).merge(user_id: current_user.id)
		#user_id: current_user.id
	end

	def auth_admin
		redirect_to root_path if current_user.admin == false
	end

	def self.free
		@@show_free
	end

end

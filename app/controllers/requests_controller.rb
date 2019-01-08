class RequestsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_billboard, :except => [:show, :index, :edit]

	def index
		@requests = Request.all
	end

	def show
		@request = Request.find(params[:id])
		# if @request.rent == nil
		#   @rent = Rent.new
		#   @rent.user_id = @request.user_id
		
		#   @request.rent = @rent
		# end
	end

	def new
		@request = Request.new

	end

	def create

		# @request = Request.new(request_params)

		# if @request.save
		#   redirect_to request_path(@request)
		# else 
	 #    redirect_to root_path
		# end

  @request = @billboard.requests.new(request_params)
  @request.user = current_user
  @request.rent = Rent.new
  @request.save

	end

	def edit
		@request = Request.find(params[:id])
		if @request.rent == nil
			@request.rent = Rent.new
		end
			@request.rent.ad_type = @request.ad_type
			@request.rent.brand = @request.brand
			@request.rent.description = @request.description
			@request.rent.start = @request.start
			@request.rent.end = @request.end
			@request.rent.user_id = @request.user_id
			@request.rent.board_id = @request.billboard_id
			@request.update(approved?: true)
			@request.rent.save
			@request.save
	end

	def update
		# @request = Request.find(params[:id])

		# @request.save
		# @redirect_to request.path(@request)
		# @billboard = Billboard.find(params[:id])
		# @billboard.update(billboard_params)
		# redirect_to billboard_path(@billboard)
	end



	private 

	def request_params
		params.require(:request).permit(:brand, :description, :start, :end, :ad_type, :billboard_id)
		#user_id: current_user.id
	end

	def set_billboard
		@billboard = Billboard.find(params[:billboard_id])
		
	end

	def auth_admin
		redirect_to root_path if current_user.admin == false
	end

	def set_rent_from_request(req)
		req.is_approved? == true
		
	end
end

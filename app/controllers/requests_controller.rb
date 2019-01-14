# frozen_string_literal: true

class RequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :auth_admin, except: %i[new create]
  before_action :set_billboard, except: %i[show index edit change_seen]

  # @@show_unseen = true
  def index
    # if session[:show_free] === nil
    #     session[:show_free] = false
    #   end
    session[:show_unseen] |= false

    @requests = if session[:show_unseen]
                  Request.all.where(approved: nil)
                else
                  Request.all
                end
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
    if @request.valid?
      @request.save
      redirect_to root_path
    end
  end

  def edit
    @request = Request.find(params[:id])
    @request.rent = Rent.new if @request.rent.nil?
    @request.rent.ad_type = @request.ad_type
    @request.rent.brand = @request.brand
    @request.rent.description = @request.description
    @request.rent.start = @request.start
    @request.rent.end = @request.end
    @request.rent.user_id = @request.user_id
    @request.rent.board_id = @request.billboard_id

    @similar_requests = Request.all.where('billboard_id = ?', @request.billboard_id)
                               .where('((start BETWEEN ? and ?) OR (end BETWEEN ? and ?)) OR ((? BETWEEN start AND end) OR (? BETWEEN start AND end))', @request.start, @request.end, @request.start, @request.end, @request.start, @request.end)
    @similar_requests.each do |request|
      request.update(approved: false)
      request.save
    end

    @request.update(approved: true)
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

  def change_seen
    session[:show_unseen] = !session[:show_unseen]
    redirect_to requests_path
  end

  private

  def request_params
    params.require(:request).permit(:brand, :description, :start, :end, :ad_type, :billboard_id)
    # user_id: current_user.id
  end

  def set_billboard
    @billboard = Billboard.find(params[:billboard_id])
  end

  def auth_admin
    redirect_to root_path if current_user.admin == false
  end

  # def set_rent_from_request(req)
  #   req.is_approved? == true
  # end
end

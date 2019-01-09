# frozen_string_literal: true

class BillboardsController < ApplicationController


  before_action :authenticate_user!, except: %i[show index free change_free cookies]
  before_action :auth_admin, only: [:new, :create]

  def index

  	session[:show_free] |= false

    if session[:show_free]
      @billboards = Billboard.all.where('id NOT IN (?)', Rent.where(:is_active? == true).where('start <= ?', DateTime.now.beginning_of_day).select(:board_id))
    else
      @billboards = Billboard.all
    end
  end


  def show
    @billboard = Billboard.find(params[:id])
    @request = Request.new
    @requests = @billboard.requests
  end

  def new
    #auth_admin
    # if current_user.admin
    @billboard = Billboard.new
    # session[:billboard_params] ||= {}

    # else
    #  redirect_to root_path
    # end
  end

  def create
    #auth_admin
    # if current_user.admin
    @billboard = Billboard.new(billboard_params)

    if @billboard.save
      redirect_to billboard_path(@billboard)
    else
      redirect_to root_path
    end
    # else
    #  redirect_to root_path
    # end
  end

  def edit
    @billboard = Billboard.find(params[:id])
  end

  def update
    @billboard = Billboard.find(params[:id])
    @billboard.update(billboard_params)
    redirect_to billboard_path(@billboard)
  end

  def change_free
    session[:show_free] = !session[:show_free]
    redirect_to billboards_path
  end
  
  private

  def billboard_params
    params.require(:billboard).permit(:city, :street, :house, :price, :image, :latitude, :longitude).merge(user_id: current_user.id)
    # user_id: current_user.id
  end

  

end

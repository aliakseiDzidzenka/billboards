# frozen_string_literal: true

class RentsController < ApplicationController
  def index
    # active = Rent.connection.quote_column_name('is_active?')
    # @rents = Rent.where(:is_active? == true).where('start <= ?', DateTime.now.beginning_of_day)

    # @boards = Billboard.find(.first).first
    # @boards = Billboard.all.where('id NOT IN (?)', Rent.where(:is_active? == true).where('start <= ?', DateTime.now.beginning_of_day).select(:board_id))

    # @r = Rent.where(:is_active? == true).where('start >= ?', DateTime.now.beginning_of_day).select(:board_id)
    authenticate_user!
    auth_admin

    @rents = Rent.all
  end

  def create; end
end

# frozen_string_literal: true

class AddAddressToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :city, :string
    add_column :users, :street, :string
    add_column :users, :house, :string
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end

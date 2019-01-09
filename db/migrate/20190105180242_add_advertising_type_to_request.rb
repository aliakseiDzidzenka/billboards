# frozen_string_literal: true

class AddAdvertisingTypeToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :ad_type, :integer
   end
end

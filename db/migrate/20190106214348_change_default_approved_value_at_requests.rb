# frozen_string_literal: true

class ChangeDefaultApprovedValueAtRequests < ActiveRecord::Migration[5.2]
  def change
    change_column :requests, :approved?, :boolean, default: false
  end
end

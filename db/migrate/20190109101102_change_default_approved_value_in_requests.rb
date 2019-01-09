# frozen_string_literal: true

class ChangeDefaultApprovedValueInRequests < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:requests, :approved?, nil)
  end
end

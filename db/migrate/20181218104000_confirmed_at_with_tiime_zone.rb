# frozen_string_literal: true

class ConfirmedAtWithTiimeZone < ActiveRecord::Migration[5.2]
  def change
    User.update_all(confirmed_at: DateTime.now)
  end
end

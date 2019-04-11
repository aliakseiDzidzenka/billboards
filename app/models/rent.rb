# frozen_string_literal: true

class Rent < ApplicationRecord
  belongs_to :request

  # validates :start, :end, :brand, :description, :is_active?, :user_id, :board_id, :request_id, :ad_type, presence: true
end

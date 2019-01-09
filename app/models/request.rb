# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :user
  belongs_to :billboard
  has_one :rent
  enum ad_type: { commercial: 0, social: 1 }, _suffix: :true

  # validates :start, :end, :brand, :description, :approved?, :user_id, :billboard_id, :ad_type, presence: true

  # def make_rent
  #   rent = Rent.new
  #   rent.ad_type = ad_type
  #   rent.brand = brand
  #   rent.description = description
  #   rent.start = start
  #   rent.user_id = user_id
  #   rent.board_id = billboard_id
  #   #approved? = true
  # end
end

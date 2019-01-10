# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :user
  belongs_to :billboard
  has_one :rent
  enum ad_type: { commercial: 0, social: 1 }, _suffix: :true

  # validates :start, :end, :brand, :description, :approved?, :user_id, :billboard_id, :ad_type, presence: true
  validate :start_date_cannot_be_in_past, :end_date_cannot_ne_in_past


  # validate :expiration_date_cannot_be_in_the_past,
  #   :discount_cannot_be_greater_than_total_value
 
  def start_date_cannot_be_in_past
    if start.present? && start < Date.today
      errors.add(start, "can't be in the past")
    end
  end
  
  # def discount_cannot_be_greater_than_total_value
  #   if discount > total_value
  #     errors.add(:discount, "can't be greater than total value")
  #   end
  # end





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

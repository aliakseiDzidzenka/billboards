# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :user
  belongs_to :billboard
  has_one :rent
  enum ad_type: { commercial: 0, social: 1 }, _suffix: :true

  # validates :start, :end, :brand, :description, :approved?, :user_id, :billboard_id, :ad_type, presence: true
  validate :start_date_cannot_be_in_past



  def start_date_cannot_be_in_past
    if start.present? && start < Date.today
      errors.add(start, "can't be in the past")
    end
  end

end

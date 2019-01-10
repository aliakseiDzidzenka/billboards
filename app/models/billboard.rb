# frozen_string_literal: true

class Billboard < ApplicationRecord
  has_many :requests
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_one_attached :image
  before_create :set_default_avatar
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  validates :city, :street, :house, :price, :user_id, :latitude, :longitude, presence: true

  def set_default_avatar
    # if !self.avatar?
    image.attach(io: File.open('app/assets/images/no.png'), filename: 'no.png', content_type: 'image/png')
    # end
  end

  def address
    [house, street, city].compact.join(', ')
  end

  def address_changed?
    city_changed? || street_changed? || house_changed?
  end
end

class Billboard < ApplicationRecord

	belongs_to :user
	has_one_attached :image
  before_create :image_nil 
  geocoded_by :address 
  after_validation :geocode, if: :address_changed?

	def image_nil
     #if !self.avatar?
         image.attach(io: File.open('app/assets/images/no.png'), filename: 'no.png', content_type: 'image/png')
     #end
  end

  def address
    [house, street, city].compact.join(", ")
  end

  def address_changed?
    city_changed? || street_changed? || house_changed?    
  end

end

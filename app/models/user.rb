class User < ApplicationRecord
  has_many :billboards  
  geocoded_by :address 
  after_validation :geocode, if: :address_changed?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, 
         omniauth_providers: [:linkedin, :facebook, :twitter]

  has_one_attached :avatar
  

 def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do | user |
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
        user.email = session["devise.user_attributes"]["email"] if user.email.blank?
        user.valid?
        
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def address
    [house, street, city].compact.join(", ")
  end

  def address_changed?
    city_changed? || street_changed? || house_changed?    
  end

  # def email_required?
  #   super && provider.blank?
  # end
  # def self.create_from_provider_data(provider_data)
  #   where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
  #     user.email = provider_data.info.email
  #     user.password = Devise.friendly_token[0, 20]
  #     user.skip_confirmation!
  #   end
  # end
 


 #  def self.from_omniauth(auth)
 #  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
 #    	user.email = auth.info.email
 #    	user.password = Devise.friendly_token[0,20]
 #    	#user.name = auth.info.name   # assuming the user model has a name
 #    	#user.image = auth.info.image # assuming the user model has an image
 #    # If you are using confirmable and the provider(s) you use validate emails, 
 #    # uncomment the line below to skip the confirmation emails.
 #    	user.skip_confirmation!
 #  	end
	# end
	# def self.new_with_session(params, session)
 #    super.tap do |user|
 #      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
 #        user.email = data["email"] if user.email.blank?
 #      elsif data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["extra"]["raw_info"]
 #        user.email = data["email"] if user.email.blank?
 #      end
 #    end
 #  end
end

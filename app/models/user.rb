# class User < ApplicationRecord
# <<<<<<< devise
#   # Include default devise modules. Others available are:
#   # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :validatable,
#          :confirmable, :omniauthable, #omniauth_providers: [:facebook, :linkedin]
#          omniauth_providers: [:linkedin, :facebook, :twitter]



#   def self.create_from_provider_data(provider_data)
#     where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
#       user.email = provider_data.info.email
#       user.password = Devise.friendly_token[0, 20]
#       user.skip_confirmation!
#     end
#   end
 


#  #  def self.from_omniauth(auth)
#  #  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#  #    	user.email = auth.info.email
#  #    	user.password = Devise.friendly_token[0,20]
#  #    	#user.name = auth.info.name   # assuming the user model has a name
#  #    	#user.image = auth.info.image # assuming the user model has an image
#  #    # If you are using confirmable and the provider(s) you use validate emails, 
#  #    # uncomment the line below to skip the confirmation emails.
#  #    	user.skip_confirmation!
#  #  	end
# 	# end
# 	# def self.new_with_session(params, session)
#  #    super.tap do |user|
#  #      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
#  #        user.email = data["email"] if user.email.blank?
#  #      elsif data = session["devise.linkedin_data"] && session["devise.linkedin_data"]["extra"]["raw_info"]
#  #        user.email = data["email"] if user.email.blank?
#  #      end
#  #    end
#  #  end
# =======
# 	before_save { self.email = email.downcase }
# 	validates :name, presence: true, length: { maximum: 30 }
# 	validates :email, presence: true, length: { maximum: 255 }
# 	  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# 	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
# 	validates :email, presence: true, length: { maximum: 255 },
#                     format: { with: VALID_EMAIL_REGEX },
#                     uniqueness: { case_sensitive: false }
# 	has_secure_password
# 	validates :password, presence: true, length: { minimum: 6 }



# >>>>>>> development
# end

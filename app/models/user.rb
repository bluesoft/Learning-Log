class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  include Gravtastic
  gravtastic
  
  
  def self.find_for_google_apps_oauth(access_token, signed_in_resource=nil)        
      data = access_token['user_info']
      email = data['email']      
      if user = User.find_by_email(email)
        user
      else
        User.create!(:email => email, :password => Devise.friendly_token[0,20])
      end
  end
end

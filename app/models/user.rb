class User < ApplicationRecord
 has_many :requirements
 has_many :votes
 has_many :requirements, through: :votes
 has_many :comments
 has_many :requirements, through: :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:google_oauth2]

    def self.from_omniauth(access_token)
        data = access_token.info
        user = User.where(email: data['email']).first

        # Uncomment the section below if you want users to be created if they don't exist
        unless user
            user = User.create(name: data['name'],
               email: data['email'],
               password: Devise.friendly_token[0,20]
            )
        end
      user
    end        
end

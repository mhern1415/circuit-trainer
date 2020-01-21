class User < ApplicationRecord
    has_many :created_exercises, foreign_key: "user_id", class_name: "Exercise"
    has_many :workouts
    has_many :completed_exercises, through: :workouts, source: :exercises
    has_many :circuits, through: :workouts
    has_secure_password

    validates :username, :email, presence: true
    validates :username, uniqueness: true 
    validates :email, confirmation: true
    validates :email_confirmation, presence: true

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.user_name = auth.info.name
          user.email = auth.info.email
          user.password = SecureRandom.hex
        end
      end
    
end

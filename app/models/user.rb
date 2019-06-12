class User < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :scenes
  has_many :instruments

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end
end

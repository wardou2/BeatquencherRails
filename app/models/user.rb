class User < ApplicationRecord
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :scenes
  has_many :instruments
end

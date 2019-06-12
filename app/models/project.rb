class Project < ApplicationRecord
  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :instruments
  has_many :scenes
  has_many :tracks, through: :scenes
end

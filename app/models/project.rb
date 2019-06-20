class Project < ApplicationRecord
  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
  has_many :instruments, dependent: :destroy
  has_many :scenes, dependent: :destroy
  has_many :tracks, through: :scenes, dependent: :destroy
end

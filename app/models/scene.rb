class Scene < ApplicationRecord
  belongs_to :project
  has_many :tracks, dependent: :destroy
end

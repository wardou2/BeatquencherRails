class Instrument < ApplicationRecord
  belongs_to :project
  has_many :tracks
end

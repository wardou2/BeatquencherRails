class Track < ApplicationRecord
  belongs_to :instrument
  belongs_to :scene
end

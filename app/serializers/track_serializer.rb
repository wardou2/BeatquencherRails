class TrackSerializer < ActiveModel::Serializer
  attributes :id, :scene, :instrument, :notes
end

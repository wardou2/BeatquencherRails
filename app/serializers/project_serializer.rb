class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :tempo, :scenes, :instruments, :tracks
end

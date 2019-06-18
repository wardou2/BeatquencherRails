class SceneSerializer < ActiveModel::Serializer
  attributes :id, :name, :project_id, :created_at, :updated_at, :tracks
end

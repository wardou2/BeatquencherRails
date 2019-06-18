class InstrumentSerializer < ActiveModel::Serializer
  attributes :id, :ins_type, :options, :tracks, :project, :effects
end

class AddEffectsToInstrumentPresets < ActiveRecord::Migration[5.2]
  def change
    add_column :instrument_presets, :effects, :jsonb, array: true, default: []
  end
end

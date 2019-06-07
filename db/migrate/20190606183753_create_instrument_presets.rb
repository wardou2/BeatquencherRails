class CreateInstrumentPresets < ActiveRecord::Migration[5.2]
  def change
    create_table :instrument_presets do |t|
      t.string :ins_type
      t.jsonb :options
    end
  end
end

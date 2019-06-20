class CreateInstrumentPresets < ActiveRecord::Migration[5.2]
  def change
    create_table :instrument_presets do |t|
      t.string :ins_type
      t.string :name
      t.jsonb :options
      t.boolean :melodic
    end
  end
end

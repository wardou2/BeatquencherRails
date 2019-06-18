class AddEffectsToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_column :instruments, :effects, :jsonb, array: true, default: []
  end
end

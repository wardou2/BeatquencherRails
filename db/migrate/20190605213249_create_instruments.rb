class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.belongs_to :project, index: true, foreign_key: true
      t.string :ins_type
      t.string :name
      t.jsonb :options

      t.timestamps
    end
  end
end

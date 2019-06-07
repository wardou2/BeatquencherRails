class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.belongs_to :scene, index: true, foreign_key: true
      t.belongs_to :instrument, index: true, foreign_key: true
      t.timestamps
    end
  end
end

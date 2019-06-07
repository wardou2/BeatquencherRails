class CreateScenes < ActiveRecord::Migration[5.2]
  def change
    create_table :scenes do |t|
      t.belongs_to :project, index: true, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end

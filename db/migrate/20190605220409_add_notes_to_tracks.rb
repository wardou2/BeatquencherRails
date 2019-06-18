class AddNotesToTracks < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :notes, :string, array: true, default: ['', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '']
  end
end

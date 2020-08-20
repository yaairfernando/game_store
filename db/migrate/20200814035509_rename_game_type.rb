class RenameGameType < ActiveRecord::Migration[6.0]
  def change
    rename_column :games, :type, :game_type
  end
end

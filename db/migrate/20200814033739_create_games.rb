class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :type
      t.integer :price
      t.string :uid

      t.timestamps
    end
  end
end

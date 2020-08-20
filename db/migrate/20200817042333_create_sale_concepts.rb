class CreateSaleConcepts < ActiveRecord::Migration[6.0]
  def change
    create_table :sale_concepts do |t|
      t.references :sale, null: false, foreign_key: true
      t.bigint :unit_price
      t.bigint :total
      t.integer :amount
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end

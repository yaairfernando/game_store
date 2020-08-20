class CreateTableSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.bigint :seller_id
      t.bigint :buyer_id
      t.bigint :total
      t.string :uid, null: false

      t.timestamps
    end
    add_foreign_key :sales, :users, column: :seller_id, primary_key: :id
    add_foreign_key :sales, :clients, column: :buyer_id, primary_key: :id
  end
end

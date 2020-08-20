class AddSaleTypeIdToSales < ActiveRecord::Migration[6.0]
  def change
    # add_column :sales, :sale_type_id, :bigint, foreign_key: true
    add_reference :sales, :sale_type, foreign_key: true
  end
end

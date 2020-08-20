class RenameSaleEnumToSaleStatus < ActiveRecord::Migration[6.0]
  def change
    rename_column :sales, :status, :sale_status
  end
end

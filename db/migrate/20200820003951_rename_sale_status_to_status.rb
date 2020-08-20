class RenameSaleStatusToStatus < ActiveRecord::Migration[6.0]
  def change
    rename_column :sales, :sale_status, :status
  end
end

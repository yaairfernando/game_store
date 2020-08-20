class AddStatusToSales < ActiveRecord::Migration[6.0]
  def change
    add_column :sales, :status, :integer
  end
end

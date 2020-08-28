class CreateSalesReports < ActiveRecord::Migration[6.0]
  def change
    create_view :sales_reports, materialized: true

    add_index :sales_reports, :id
    add_index :sales_reports, :created_at
    add_index :sales_reports, :updated_at
    add_index :sales_reports, :total
    add_index :sales_reports, :status
    add_index :sales_reports, :sale_type
    add_index :sales_reports, :category
    add_index :sales_reports, :currency
    add_index :sales_reports, :country
  end
end

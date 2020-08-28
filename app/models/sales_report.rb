class SalesReport < ApplicationRecord
  self.primary_key = :id
  
  def self.refresh
    Scenic.database.refresh_materialized_view('sales_reports', concurrently: false, cascade: false)
  end

  def readonly?
    true
  end
end
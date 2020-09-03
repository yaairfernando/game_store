class SalesReport < ApplicationRecord
  self.primary_key = :id
  
  def self.refresh
    Scenic.database.refresh_materialized_view('sales_reports', concurrently: false, cascade: false)
  end

  def readonly?
    true
  end

  scope :by_country, ->(country) do
    if country
      where(country: country)
    else
      all
    end
  end

  scope :by_sale_type, ->(sale_type) do
    if sale_type
      where(sale_type: sale_type)
    else
      all
    end
  end
end
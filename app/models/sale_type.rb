class SaleType < ApplicationRecord
  enum category: %i[normal massive]
  has_many :sales
end

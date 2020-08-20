class AddCategoryToSaleTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :sale_types, :category, :integer
  end
end

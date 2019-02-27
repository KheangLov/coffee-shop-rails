class AddCompaniesIdToStockCate < ActiveRecord::Migration[5.1]
  def change
    add_reference :stock_categories, :company, foreign_key: true, index: true
  end
end

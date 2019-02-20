class AddBranchIdToStockCategory < ActiveRecord::Migration[5.1]
  def change
    add_reference :stock_categories, :branch, foreign_key: true, index: true
  end
end

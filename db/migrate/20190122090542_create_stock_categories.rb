class CreateStockCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_categories do |t|
      t.string :name, unique: true, index: true
      t.string :description

      t.timestamps
    end
  end
end

class CreateProductSales < ActiveRecord::Migration[5.1]
  def change
    create_table :product_sales do |t|

      t.timestamps
    end
  end
end

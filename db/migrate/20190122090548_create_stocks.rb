class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.references :stock_category, foreign_key: true, index: true

      t.string :name, index: true
      t.string :description
      t.decimal :price, precision: 10, scale: 2
      t.decimal :sale_price, precision: 10, scale: 2
      t.date :expired_date
      t.decimal :qty, precision: 10, scale: 2

      t.timestamps
    end
  end
end

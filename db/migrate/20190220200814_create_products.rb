class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :product_category, foreign_key: true, index: true
      t.references :stock, foreign_key: true, index: true

      t.string :name, index: true
      t.decimal :price, precision: 10, scale: 2
      t.decimal :qty, precision: 10, scale: 2
      t.integer :sale

      t.timestamps
    end
  end
end

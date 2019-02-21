class Product < ApplicationRecord
  belongs_to :stock
  belongs_to :product_category
end

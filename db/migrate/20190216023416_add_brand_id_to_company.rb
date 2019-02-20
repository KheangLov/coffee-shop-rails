class AddBrandIdToCompany < ActiveRecord::Migration[5.1]
  def change
    add_reference :branches, :company, foreign_key: true, index: true
  end
end

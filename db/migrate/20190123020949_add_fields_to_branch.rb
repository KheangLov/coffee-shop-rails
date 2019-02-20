class AddFieldsToBranch < ActiveRecord::Migration[5.1]
  def change
    add_column :branches, :name, :string
    add_column :branches, :description, :string
    add_column :branches, :address, :string
    add_column :branches, :phone, :string
    add_column :branches, :email, :string
  end
end

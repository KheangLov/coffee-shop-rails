class AddFieldsToStock < ActiveRecord::Migration[5.1]
  def change
    add_reference :stocks, :branch, foreign_key: true, index: true
    add_column :stocks, :alerted, :boolean
    add_column :stocks, :alert_qty, :integer
    add_column :stocks, :status, :string
  end
end

class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.references :user, foreign_key: true, index: true
      t.string :name, unique: true
      t.string :website
      t.string :email
      t.string :phone
      t.string :address
      t.string :descriptions

      t.timestamps
    end
  end
end

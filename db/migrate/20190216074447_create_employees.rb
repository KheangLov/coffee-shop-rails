class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.references :company, foreign_key: true, index: true
      t.references :branch, foreign_key: true, index: true

      t.string :firstname
      t.string :lastname
      t.string :fullname
      t.date :dob
      t.string :address
      t.string :phone
      t.string :email
      t.string :position
      t.string :work_time
      t.decimal :salary, precision: 10, scale: 2

      t.timestamps
    end
  end
end

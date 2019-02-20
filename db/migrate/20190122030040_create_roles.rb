class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name, unique: true
      t.string :descriptions

      t.timestamps
    end
  end
end

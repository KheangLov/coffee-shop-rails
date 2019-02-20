class AddStatusToUser < ActiveRecord::Migration[5.1]
  def change
    execute <<-SQL
      CREATE TYPE gender AS ENUM ('male', 'female', 'other');
      CREATE TYPE status AS ENUM ('pending', 'active', 'inactive', 'banned');
    SQL
    add_column :users, :gender, :gender, default: 'other', index: true
    add_column :users, :status, :status, default: 'active', index: true
  end
end

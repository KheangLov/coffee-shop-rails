class AddCompanyStatus < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      CREATE TYPE statuses AS ENUM ('pending', 'active', 'inactive', 'banned');
    SQL
    add_column :companies, :status, :status, default: 'active', index: true
  end

  def down
    remove_column :companies, :status
    execute <<-SQL
      DROP TYPE statuses;
    SQL
  end
end

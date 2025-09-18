class EnableSimilaritySearch < ActiveRecord::Migration[8.0]
  def up
    # Enable the pg_trgm extension for similarity search
    execute "CREATE EXTENSION IF NOT EXISTS pg_trgm;"

    # Add GIN index for faster similarity searches
    add_index :users, :name, using: :gin, opclass: :gin_trgm_ops
    add_index :users, :first_name, using: :gin, opclass: :gin_trgm_ops
    add_index :users, :last_name, using: :gin, opclass: :gin_trgm_ops
  end

  def down
    remove_index :users, :name
    remove_index :users, :first_name
    remove_index :users, :last_name
    execute "DROP EXTENSION IF EXISTS pg_trgm;"
  end
end

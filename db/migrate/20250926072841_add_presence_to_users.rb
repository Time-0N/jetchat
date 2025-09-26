class AddPresenceToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :online_status, :boolean, default: false, null: false
    add_column :users, :connection_count, :integer, default: 0, null: false
    add_column :users, :last_seen_at, :datetime

    add_index :users, :online_status
    add_index :users, :last_seen_at
  end
end

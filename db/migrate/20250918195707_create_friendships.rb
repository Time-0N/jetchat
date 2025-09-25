class CreateFriendships < ActiveRecord::Migration[8.0]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false, foreign_key: { to_table: :users }
      t.references :friend_request, null: false, foreign_key: true
      t.datetime :became_friends_at, default: -> { 'CURRENT_TIMESTAMP' }

      t.timestamps
    end

    # Ensure friendship uniqueness and fast lookups
    add_index :friendships, [ :user_id, :friend_id ], unique: true
    add_index :friendships, [ :friend_id, :user_id ]
  end
end

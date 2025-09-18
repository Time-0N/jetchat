class CreateFriendRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :friend_requests do |t|
      t.references :sender, null: false, foreign_key: { to_table: :users }
      t.references :receiver, null: false, foreign_key: { to_table: :users }
      t.string :status, default: 'pending' # pending, accepted, declined
      t.text :message # optional message with request
      t.datetime :responded_at

      t.timestamps
    end

    # Prevent duplicate requests
    add_index :friend_requests, [:sender_id, :receiver_id], unique: true
    add_index :friend_requests, [:receiver_id, :status]
    add_index :friend_requests, [:sender_id, :status]
  end
end

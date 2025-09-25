class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chat_room, null: false, foreign_key: true
      t.text :content, null: false
      t.string :message_type, default: 'text' # text, system
      t.json :metadata # for future extensions

      t.timestamps
    end

    # Critical indexes for performance
    add_index :messages, [ :chat_room_id, :created_at ]
  end
end

class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :sub
      t.string :name
      t.string :first_name
      t.string :last_name
      t.jsonb :metadata

      t.timestamps
    end

    add_index :users, :sub, unique: true
    add_index :users, :email, unique: true
  end
end

class DeviseCreateMembers < ActiveRecord::Migration

  def self.up
    create_table(:members) do |t|
      # Devise columns
      t.database_authenticatable null: false
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      t.lockable
      # Member columns
      t.string :name, null: false
      t.boolean :moderator, null: false, default: false
      t.boolean :administrator, null: false, default: false
      t.boolean :banned, null: false, default: false
      t.timestamps
    end

    %w(

         name
         email
         confirmation_token
         reset_password_token
         unlock_token

    ).each do |column|
      add_index :members, column, unique: true
    end
  end

  def self.down
    drop_table :members
  end
end

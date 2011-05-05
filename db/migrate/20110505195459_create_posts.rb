class CreatePosts < ActiveRecord::Migration

  def self.up
    create_table :posts do |t|
      t.references :topic, :null => false
      t.text :content, :null => false, :default => ''
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end

end

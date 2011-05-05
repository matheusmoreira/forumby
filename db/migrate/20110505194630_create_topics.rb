class CreateTopics < ActiveRecord::Migration

  def self.up
    create_table :topics do |t|
      t.references :forum, :null => false
      t.string :title, :null => false, :default => ''
      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end

end

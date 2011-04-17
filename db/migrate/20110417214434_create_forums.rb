class CreateForums < ActiveRecord::Migration

  def self.up
    create_table :forums do |t|
      t.references :category
      t.string :name, :null => false, :default => ''
      t.text :description, :null => false, :default => ''
      t.timestamps
    end
  end

  def self.down
    drop_table :forums
  end

end

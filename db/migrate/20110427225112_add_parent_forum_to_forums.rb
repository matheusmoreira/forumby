class AddParentForumToForums < ActiveRecord::Migration

  def self.up
    add_column :forums, :parent_forum_id, :integer
  end

  def self.down
    remove_column :forums, :parent_forum_id
  end

end

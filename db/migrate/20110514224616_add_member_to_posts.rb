class AddMemberToPosts < ActiveRecord::Migration

  def self.up
    # Creating a non-null column without a default value
    #
    # Create the column without the constraint ...
    add_column :posts, :member_id, :integer
    # ... then add the constraint.
    change_column :posts, :member_id, :integer, :null => false
  end

  def self.down
    remove_column :posts, :member_id
  end

end

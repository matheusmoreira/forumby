class Forum < ActiveRecord::Base

  belongs_to :category

  # Forums can be nested
  has_many :nested_forums,
           :class_name => 'Forum',
           :foreign_key => 'parent_forum_id',
           :dependent => :nullify
  belongs_to :parent_forum,
             :class_name => 'Forum'

  validates_presence_of :name

  validates_length_of :name, :within => 1..80
  validates_length_of :description, :maximum => 1000

  def has_nested_forums?
    not nested_forums.empty?
  end

  def nested?
    not parent_forum.nil?
  end

  def self.without_category
    where :category_id => nil
  end

  def self.without_parent
    where :parent_forum_id => nil
  end

  def self.top_level
    where :category_id => nil, :parent_forum_id => nil
  end

  def self.per_page
    30
  end

end

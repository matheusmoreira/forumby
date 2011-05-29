class Topic < ActiveRecord::Base

  belongs_to :forum

  has_many :posts, :dependent => :destroy

  accepts_nested_attributes_for :posts

  validates_presence_of :forum, :title

  validates_length_of :title, :within => 1..80

  def first_post
    posts.first
  end

end

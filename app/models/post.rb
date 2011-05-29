class Post < ActiveRecord::Base

  belongs_to :topic
  belongs_to :member

  validates_presence_of :member, :topic, :content

  validates_length_of :content, :minimum => 1

end

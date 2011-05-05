class Post < ActiveRecord::Base

  belongs_to :topic

  validates_presence_of :content

  validates_length_of :content, :minimum => 1

end

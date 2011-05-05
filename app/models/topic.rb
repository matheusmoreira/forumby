class Topic < ActiveRecord::Base

  belongs_to :forum
  has_many :posts

  validates_presence_of :title

  validates_length_of :title, :within => 1..80

end

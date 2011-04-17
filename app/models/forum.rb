class Forum < ActiveRecord::Base

  belongs_to :category

  validates_presence_of :name

  validates_length_of :name, :within => 1..80
  validates_length_of :description, :maximum => 1000

  def self.per_page
    30
  end

end

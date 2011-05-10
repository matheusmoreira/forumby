class Category < ActiveRecord::Base

  has_many :forums, :dependent => :nullify

  validates_presence_of :name

  validates_length_of :name, :within => 1..80
  validates_length_of :description, :maximum => 1000

  def has_description?
    not description.blank?
  end

  def has_forums?
    not forums.empty?
  end

  def self.per_page
    10
  end

end

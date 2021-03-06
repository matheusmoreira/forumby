class Member < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable,
         :confirmable,
         :recoverable,
         :rememberable,
         :trackable,
         :lockable,
         :validatable

  has_many :posts

  # Devise already validates presence of email and password
  validates_presence_of :name

  validates_format_of :name, :with => /^[\d\w]+$/

  # Devise already validates uniqueness of email
  validates_uniqueness_of :name

  validates_length_of :name, :minimum => 1

  validates_length_of :email, :minimum => 5  # "x@y.z".length

  attr_accessible :name,
                  :email,
                  :password,
                  :password_confirmation,
                  :remember_me

  def topics
    # How can I optimize this?
    Topic.select { |topic| topic.first_post.member.id == self.id }
  end

  def post_count
    posts.count
  end

  def topic_count
    topics.count
  end

  def self.per_page
    50
  end

end

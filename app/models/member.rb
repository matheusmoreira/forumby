class Member < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable,
         :confirmable,
         :recoverable,
         :rememberable,
         :trackable,
         :lockable,
         :validatable

  # Devise already validates presence of email and password
  validates_presence_of :name

  validates_format_of :name, :with => /^[\d\w\s]+$/

  # Devise already validates uniqueness of email
  validates_uniqueness_of :name

  validates_length_of :name, :minimum => 1

  validates_length_of :email, :minimum => 5  # "x@y.z".length

  attr_accessible :name,
                  :email,
                  :password,
                  :password_confirmation,
                  :remember_me

  def self.per_page
    50
  end

end

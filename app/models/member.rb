class Member < ActiveRecord::Base

  devise :database_authenticatable,
         :registerable,
         :confirmable,
         :recoverable,
         :rememberable,
         :trackable,
         :lockable,
         :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
end

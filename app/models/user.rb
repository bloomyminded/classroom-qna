class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :courses, 
    as: :student,
    through: :memberships
  has_many :questions
  has_many :votes
  has_many :comments
  has_many :memberships
end

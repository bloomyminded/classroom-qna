class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :courses, as: :student
  has_many :questions
  has_many :votes
  has_many :comments
end

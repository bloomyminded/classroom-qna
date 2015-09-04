class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :lecture
  has_many :comments
  has_many :votes
end

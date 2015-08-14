class Question < ActiveRecord::Base
  has_many :comments
  has_many :votes
end

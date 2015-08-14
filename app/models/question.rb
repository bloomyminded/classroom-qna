class Question < ActiveRecord::Base
  has_many :comments, :votes
end

class Question < ActiveRecord::Base
  has_many :comments
  has_many :votes

  def get_votes
    count = 0
    votes.each do |v|
      count += v.up
    end
    count
  end
end

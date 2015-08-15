class Question < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  def get_votes
    count = 0
    votes.each do |v|
      count += 1 
    end
    count
  end

end

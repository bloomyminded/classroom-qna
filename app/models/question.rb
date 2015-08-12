class Question < ActiveRecord::Base

  def upvote_rank? #change threshold in production
    case self.upvote
    when 0..3
      'ratinglow'
    when 4..7
      'ratingmed'
    when 7..300
      'ratinghigh'
    end
  end

end

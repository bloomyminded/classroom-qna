class Question < ActiveRecord::Base

  scope :low, ->{ where('upvote BETWEEN 0 AND 3') }
  scope :med, ->{ where('upvote BETWEEN 4 AND 7') }
  scope :high, ->{ where('upvote >= 8') }

  def upvote_rank? #change threshold in production
    case self.upvote
    when 0..3
      'badge-low'
    when 4..7
      'badge-med'
    when 7..300
      'badge-high'
    end
  end

end

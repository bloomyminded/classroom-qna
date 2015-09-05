class Lecture < ActiveRecord::Base
  belongs_to :course
  has_many :questions

  def questions_count
    questions.count
  end

  def comments_count
    questions.map { |q| q.comments.count }.sum
  end

  def votes_count
    questions.map { |q| q.votes.count }.sum
  end

  def students 
    self.course.students
  end
end

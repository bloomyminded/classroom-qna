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

  scope :admins, -> { where(:is_admin => true) }  

  def to_s
    "#{self.first_name} #{self.last_name}"
  end

  def is_student? course
    course.students.exists?(self.id)
  end
end

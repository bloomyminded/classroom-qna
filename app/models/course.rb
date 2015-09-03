class Course < ActiveRecord::Base
  belongs_to :schools
  has_many :lectures
  has_many :students,
    through: :memberships,
    source: :user,
    foreign_key: :email
  has_many :memberships
end

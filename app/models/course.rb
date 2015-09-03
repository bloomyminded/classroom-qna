class Course < ActiveRecord::Base
  belongs_to :school
  has_many :lectures
  has_many :students,
    class_name: "User",
    foreign_key: :user_id 
end

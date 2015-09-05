School.destroy_all
Course.destroy_all
Lecture.destroy_all
User.destroy_all
Question.destroy_all
Comment.destroy_all
Vote.destroy_all

User.new(first_name: "Admin", 
         last_name: "Flapjack",
         email: "admin@qna.com", 
         password: "password", 
         password_confirmation: "password",
         is_admin: true).save!(validate: false)

User.new(first_name: "Professor", 
         last_name: "Farnsworth",
         email: "farnsworth@3012.com", 
         password: "password", 
         password_confirmation: "password",
         is_admin: false).save!(validate: false)

300.times do |n|
  first_name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.safe_email(first_name + last_name) 
  password = "password"
  User.new(first_name: first_name,
           last_name: last_name,
           email: email,
           password:              password,
           password_confirmation: password).save!(validate: false)
end

#Schools
10.times do
  name = "U" + (0...2).map { (65 + rand(26)).chr  }.join 
  city = Faker::Address.city
  state = Faker::Address.state_abbr
  zip = Faker::Address.zip
  School.new(name: name,
             city: city,
             state: state,
             zip: zip).save!
end

#Courses
School.all.each do |s|
  4.times do |c|
    name = "CS 10#{c}"
    description = Faker::Lorem.paragraph
    course = s.courses.create(name: name, 
                              description: description,
                              user_id: User.all[1].id)

    30.times do
      student = User.all.limit(1).order("RANDOM()").first
      course.students << student
    end
  end
end

#Lectures
Course.all.each do |c|
  5.times do
    title = Faker::Lorem.sentence(3).capitalize
    c.lectures.create(title: title)
  end
end

#Questions
Lecture.all.each do |l|
  students = l.course.students
  10.times do
    student = students.limit(1).order("RANDOM()").first
    body = Faker::Lorem.paragraph
    student.questions.create(body: body, lecture_id: l.id)
  end
end

#Comments
Question.all.each do |q|
  students = q.lecture.course.students
  body = Faker::Lorem.sentence
  questionid = q.id
  3.times do |c|
    student = students.limit(1).order("RANDOM()").first
    student.comments.create(body: body, question_id: questionid)
  end
end

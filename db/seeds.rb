School.destroy_all
Course.destroy_all
Lecture.destroy_all
User.destroy_all
Question.destroy_all
Comment.destroy_all
Vote.destroy_all

#Schools
5.times do
  state = Faker::Address.state
  name = "University of " + state
  city = Faker::Address.city
  zip = Faker::Address.zip
  School.new(name: name,
             city: city,
             state: state,
             zip: zip).save!
end

User.new(first_name: "Admin", 
         last_name: "Flapjack",
         email: "admin@qna.com", 
         password: "password", 
         password_confirmation: "password").save!(validate: false)

User.all[0].add_role :admin

User.new(first_name: "Professor", 
         last_name: "Farnsworth",
         email: "instructor@qna.com", 
         password: "password", 
         password_confirmation: "password").save!(validate: false)

User.all[1].add_role :instructor

User.new(first_name: "Philip", 
         last_name: "Fry",
         email: "student@qna.com", 
         password: "password", 
         password_confirmation: "password",
         school_id: 1).save!(validate: false)


100.times do |n|
  first_name  = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.safe_email(first_name + last_name) 
  password = "password"
  User.new(first_name: first_name,
           last_name: last_name,
           email: email,
           password: password,
           school_id: School.all.limit(1).order("RANDOM()").first.id,
           password_confirmation: password).save!(validate: false)
end


#Courses
School.all.each do |s|
  4.times do |c|
    name = "CS 10#{c}"
    description = Faker::Lorem.paragraph
    course = s.courses.create(name: name, 
                              description: description,
                              user_id: User.all[1].id)

    10.times do
      student = User.where(school_id: s.id).limit(1).order("RANDOM()").first
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
  8.times do
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

require 'faker'

User.destroy_all
Question.destroy_all
Comment.destroy_all
Vote.destroy_all

User.new(name: "Admin", 
         email: "admin@qna.com", 
         password: "password", 
         password_confirmation: "password").save!(validate: false)

99.times do |n|
  name  = Faker::Name.name
  email = "#{name}@email.org"
  password = "password"
  User.new(name:  name,
               email: email,
               password:              password,
               password_confirmation: password).save!(validate: false)
end

20.times do |n|
  body = Faker::Lorem.paragraph
  userid = 1..99
  Question.new(body: body, user_id: userid).save!
end

32.times do |n|
  body = Faker::Lorem.sentence
  questionid = rand(1..20)
  User.limit(1).order("RANDOM()").first.comments.create(body: body,
                                                      question_id: questionid)
end

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
         password_confirmation: "password").save!(validate: false)

50.times do |n|
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

10.times do
  name = (0...3).map { (65 + rand(26)).chr  }.join 
  city = Faker::Address.city
  state = Faker::Address.state_abbr
  zip = Faker::Address.zip
  School.new(name: name,
             city: city,
             state: state,
             zip: zip).save!
end

10.times do |s|
  4.times do |c|
    name = (0...2).map { (65 + rand(26)).chr }.join + " 3#{s}#{c}"
    description = Faker::Lorem.paragraph
    School.where(id: s+1).first.courses.new(name: name,
                                            description: description).save!
  end
end

#20.times do |n|
#  body = Faker::Lorem.paragraph
#  User.limit(1).order("RANDOM()").first.questions.create(body: body)
#end
#
#32.times do |n|
#  body = Faker::Lorem.sentence
#  questionid = rand(1..20)
#  User.limit(1).order("RANDOM()").first.comments.create(body: body,
#                                                      question_id: questionid)
#end

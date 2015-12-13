# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "foobar",
             email: "foobar@example.com",
             password: "foobar11",
             password_confirmation: "foobar11")
emails = []
20.times do |n|
  name = Faker::Internet.user_name
  email = Faker::Internet.safe_email
  until !emails.include?(email)
    email = Faker::Internet.safe_email
  end
  password = "foobar11"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end


50.times do |n|
  title = Faker::Lorem.words(4).join(' ')
  date = Faker::Date.forward(60)
  start = Faker::Time.forward(60, :evening)
  location = Faker::Address.street_address
  description = Faker::Lorem.paragraphs.join(' ')
  host = rand(20)+1
  Event.create!(title: title,
                date: date,
                start: start,
                location: location,
                description: description,
                user_id: host)
end

80.times do |n|
  content = Faker::Lorem.paragraph
  event = rand(50)+1
  user = rand(20) + 1
  Comment.create!(content: content,
                  event_id: event,
                  user_id: user)
end

100.times do |n|
  event = rand(50)+1
  user = rand(20)+1
  Attending.create!(attended_event_id: event,
                    attendee_id: user,
                    going: true)
end

100.times do |n|
  event = rand(50) + 1
  to = rand(20) + 1
  from = rand(20) + 1
  Invitation.create!(event_id: event,
                      invitee_id: to,
                      inviter_id: from)
end
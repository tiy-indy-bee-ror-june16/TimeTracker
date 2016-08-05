# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
devusers = 10.times.map do
  User.create!(
  username: Faker::Internet.user_name,
  password: "password",
  email: Faker::Internet.email,
  role: "developer"
  )
end

adminusers = 2.times.map do
  User.create!(
  username: Faker::Internet.user_name,
  password: "password",
  email: Faker::Internet.email,
  role: "admin"
  )
end


projects = 8.times.map do
  tempproject = Project.create!(
  title: Faker::Company.catch_phrase
  )
  tempproject.users << adminusers.sample
  usedusers = []
  userprojects = 4.times.map do
    user = devusers.sample
    while usedusers.include?(user)
      user = devusers.sample
    end
    usedusers << user
    tempproject.users << user
    timers = 3.times.map do
      Timer.create!(
      value: rand(12),
      user: user,
      project: tempproject
      )
    end
  end
end

# projects.each do |project|
#   project.users << adminusers.sample
# end

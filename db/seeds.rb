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
  email: Faker::Internet.safe_email,
  role: "developer"
  )
end

adminusers = 2.times.map do
  User.create!(
  username: Faker::Internet.user_name,
  password: "password",
  email: Faker::Internet.safe_email,
  role: "admin"
  )
end

clientusers = 3.times.map do
  User.create!(
  username: Faker::Internet.user_name,
  password: "password",
  email: Faker::Internet.safe_email,
  role: "client"
  )
end


projects = 8.times.map do
  tempproject = Project.create!(
  title: Faker::Company.catch_phrase,
  owner_id: adminusers.sample.id,
  summary: Faker::Company.catch_phrase,
  estimated_time: Faker::Number.between(50, 200),
  client_id: clientusers.sample.id
  )
  usedusers = []
  userprojects = 4.times.map do
    user = devusers.sample
    while usedusers.include?(user)
      user = devusers.sample
    end
    usedusers << user
    tempproject.users << user
    timers = 3.times.map do
      value = rand(10800..28800)
      starttime = Faker::Time.between(8.days.ago, Date.today, :day)
      Timer.create!(
      value: value,
      user: user,
      project: tempproject,
      updated_at: starttime + value,
      created_at: starttime
      )
    end
  end
end

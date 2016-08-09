FactoryGirl.define do
  factory :project do
      title { Faker::Book.title }
      estimated_time { rand(200) }
      owner
      client
  end
end

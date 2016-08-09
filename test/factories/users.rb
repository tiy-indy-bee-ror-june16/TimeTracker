FactoryGirl.define do
  factory :user do
      username { Faker::Internet.user_name(nil, %w(_)) }
      email { Faker::Internet.email }
      password { Faker::Internet.password }
      factory :client do
        role "client"
      end
      factory :owner do
        role "admin"
      end
  end

end

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "by default, users should have a role of 'developer'" do
    user = User.create!(
      email: Faker::Internet.email,
      username: "bucky",
      password: 'playground'
    )
    assert_equal "developer", user.role
  end

  test "usernames should contain no spaces or funny business" do
    user = User.new(
      email: Faker::Internet.email,
      username: 'My weird username. This should "totally" fail to, you know, save.',
      password: 'playground'
    )
    refute user.save
  end

  test "should validate emails are email-like" do
    user = User.new(
      email: 'srgerhgegh',
      username: 'bucky',
      password: 'playground'
    )
    refute user.save
  end

end

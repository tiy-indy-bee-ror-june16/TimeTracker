require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "by default, users should have a role of 'developer'" do
    user = build(:user)
    user.attributes.delete(:role)
    user.save!
    assert user.persisted?
    assert_equal "developer", user.reload.role
  end

  test "usernames should contain no spaces or funny business" do
    user = build(:user, username: 'My weird username. This should "totally" fail to, you know, save.')
    refute user.save
  end

  test "should validate emails are email-like" do
    user = build(:user, email: 'srgerhgegh.net')
    refute user.save
  end

end

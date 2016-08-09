require 'test_helper'

class UserTest < ActiveSupport::TestCase

  should have_secure_password
  should have_many(:projects)
  should_not allow_value("srgerhgegh.net").for(:email)
  should_not allow_value('My weird username. This should "totally" fail to, you know, save.').for(:username)

  test "by default, users should have a role of 'developer'" do
    user = build(:user)
    user.attributes.delete(:role)
    user.save!
    assert user.persisted?
    assert_equal "developer", user.reload.role
  end

end

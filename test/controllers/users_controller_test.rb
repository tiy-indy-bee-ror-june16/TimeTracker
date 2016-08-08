require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "user signup should load" do
    get new_user_url
    assert_response :success
  end

end

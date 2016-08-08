require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest

  test "signup without a project works" do
    visit(new_user_path)
    assert page.current_path == new_user_path
    fill_in('Username', with: 'wolverine')
    fill_in('Email', with: 'c@harles.com')
    fill_in('Password', with: 'playground')
    click_button('Create User')
    assert page.current_path == root_path
    refute page.has_content?('Sign In')
    assert page.has_selector?('a[href="/logout"]')
    assert page.has_content?('wolverine')
    assert_equal 'wolverine', User.last.username
    assert_equal 'developer', User.last.role
  end

  test "signup with a project works" do
    owner = User.create!(
      username: 'bob',
      role: 'admin',
      email: 'bob@bob.com',
      password: 'playground'
    )
    client = User.create!(
      username: 'bobby',
      role: 'client',
      email: 'bob@bobby.com',
      password: 'playground'
    )
    project = Project.create!(
      owner: owner,
      client: client,
      title: 'Test projects',
      estimated_time: 140
    )
    invite = Invite.create!(email: 'chuck@chuck.com', project: project)
    visit(new_project_user_path(project, email: 'chuck@chuck.com'))
    # page.save_and_open_screenshot
    assert page.has_selector?("//input[@value='chuck@chuck.com']")
    fill_in('Username', with: 'chuck')
    fill_in('Password', with: 'playground')
    click_button('Create User')
    assert page.current_path == root_path
    assert page.has_content?(project.title)
  end

  test "signup with invalid params should give and error message and reload form" do
    visit(new_user_path)
    fill_in('Username', with: 'Hi. Im excited to be here, with all ya\'ll.\nThis should not save or anything')
    fill_in('Email', with: 'segerge')
    click_button('Create User')
    assert page.current_path == new_user_path
    assert page.has_selector?('.alert-danger')
    assert page.has_content?("Invalid Information")
  end

end

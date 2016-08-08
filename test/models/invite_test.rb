require 'test_helper'

class InviteTest < ActiveSupport::TestCase

  test "should belong_to project" do
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
    invite = Invite.new(email: 'chuck@chuck.com')
    invite.project = project
    assert invite.save
    assert invite.reload.project == project
  end

end

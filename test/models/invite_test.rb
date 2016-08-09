require 'test_helper'

class InviteTest < ActiveSupport::TestCase

  test "should belong_to project" do
    project = create(:project)
    invite = Invite.new(email: 'chuck@chuck.com')
    invite.project = project
    assert invite.save
    assert invite.reload.project == project
  end

end

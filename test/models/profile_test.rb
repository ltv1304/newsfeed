require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  def setup
    user = User.new(email: 'test100@test.com', password: '123456', password_confirmation: '123456', 'profile_attributes': {name: 'test', role: 'user', mailing_period: 'cancel'})
    @profile = user.profile
    
  end

  test "should be valid" do
    assert @profile.valid?
  end

  test 'name shuld be present' do
    @profile.name = " "
    assert_not @profile.valid?
  end

  test 'name should not be too long' do
    @profile.name = "a"*51
    assert_not @profile.valid?
  end
end

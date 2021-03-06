require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  before do
    @user = users(:aragorn)
    login_as(@user, scope: :user)
  end
  test 'should get show' do
    get profile_path(@user.profile)
    assert_response :success
  end

  test 'should get edit' do
    get edit_profile_path(@user.profile)
    assert_response :success
  end
end

require 'test_helper'

feature 'User::Login' do
  before do
    @user = User.create(email: 'example@rails.com', password: '123456')
  end

  scenario 'user can login' do
    visit '/users/sign_in'

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    assert_equal '/', current_path
  end
end

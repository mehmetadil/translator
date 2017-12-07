require "test_helper"

feature "User::Login" do
  scenario "user can login" do
    user = FactoryBot.create(:user)

    visit '/users/sign_in' 

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    assert_equal '/', current_path
  end
end

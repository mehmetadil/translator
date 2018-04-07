require "test_helper"

feature "User::Register" do
  scenario "user can register" do
    visit '/users/sign_up' 

    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    page.must_have_content('Profilim')
  end
end

require "test_helper"

feature "CanAccessHome" do
  scenario "user can access home page" do
    visit '/'
    page.must_have_content "Translator"
  end
end

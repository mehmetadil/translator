require "test_helper"

feature "CanAccessHome" do
  scenario "the test is sound" do
    visit '/'
    page.must_have_content "Translator"
  end
end

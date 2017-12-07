require "test_helper"

feature "Article" do
  scenario "user can add article" do
    @user = FactoryBot.create(:user)
    sign_in(@user)
    visit '/articles/new' 

    fill_in 'Name', with: 'Test Article'
    fill_in 'article[description]', with: 'This is a test'
    #select "Türkçe", :from => "article_language_id"
    fill_in 'article_article_material_description', with: 'Test Article Material'
    attach_file('article[article_material][material]', 'tmp/lorem_ipsum.odt')
    click_on 'Create Article'
    assert_current_path article_path(Article.last)
  end
end

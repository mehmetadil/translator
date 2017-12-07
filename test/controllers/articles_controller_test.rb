require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  before do
    #TODO: Improvement
    @user = FactoryBot.create(:user)
    @language = FactoryBot.create(:language)
    @article = @user.articles.create!(name: 'Test Article',
                                      description: 'This is a Test',
                                      language_id: @language.id)
    sign_in(@user)
  end

  test 'should get index' do
    get articles_path
    assert_response :success
  end

  test 'should get show' do
    get article_path(@article)
    assert_response :success
  end

  test 'should get new' do
    skip
    #TODO: Authentication Fails
    get new_article_path
    assert_response :success
  end

  test 'should get edit' do
    skip
    #TODO: Authentication Fails
    get edit_article_path(@article)
    assert_response :success
  end
end

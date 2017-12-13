require 'test_helper'

class TranslatedArticlesControllerTest < ActionDispatch::IntegrationTest
  before do
    @user = users(:aragorn)
    @translated_article = translated_articles(:one)
    login_as(@user, scope: :user)
  end

  test 'should get show' do
    get translated_article_path(@translated_article)
    assert_response :success
  end
end

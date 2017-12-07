require 'test_helper'

class TranslatedArticlesControllerTest < ActionDispatch::IntegrationTest
  before do
    @translated_article = FactoryBot.create(:translated_article)
    sign_in(@translated_article.article.user)
  end

  test 'should get show' do
    get translated_article_path(@translated_article)
    assert_response :success
  end
end

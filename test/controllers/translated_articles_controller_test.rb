require 'test_helper'

class TranslatedArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get translated_articles_show_url
    assert_response :success
  end

end

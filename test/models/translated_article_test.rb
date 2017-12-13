require 'test_helper'

class TranslatedArticleTest < ActiveSupport::TestCase
  test 'the translated article should exist' do
    @translated_article = translated_articles(:one)
    # TODO
    # assert true
  end
end

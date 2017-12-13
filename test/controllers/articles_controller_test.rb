require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  before do
    @user = users(:aragorn)
    @language = languages(:turkish)
    @article = articles(:one)
    login_as(@user, scope: :user)
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
    get new_article_path
    assert_response :success
  end

  test 'should get edit' do
    get edit_article_path(@article)
    assert_response :success
  end
end

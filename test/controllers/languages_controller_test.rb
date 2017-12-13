require 'test_helper'

class LanguagesControllerTest < ActionDispatch::IntegrationTest
  before do
    @language = languages(:turkish)
  end

  test "should get index" do
    get languages_path
    assert_response :success
  end

  test "should get show" do
    get language_path(@language)
    assert_response :success
  end

  test "should get new" do
    get new_language_path
    assert_response :success
  end

  test "should get edit" do
    get edit_language_path(@language)
    assert_response :success
  end

end

require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | Ruby on Rails Tutorial Sample App"
  end

  test "should get product" do
    get :product
    assert_response :success
    assert_select "title", "Product | Ruby on Rails Tutorial Sample App"
  end

  test "should get news" do
    get :news
    assert_response :success
    assert_select "title", "News | Ruby on Rails Tutorial Sample App"
  end

  test "should get questionnaire" do
    get :questionnaire
    assert_response :success
    assert_select "title", "Questionnaire | Ruby on Rails Tutorial Sample App"
  end

  test "should get stationery" do
    get :stationery
    assert_response :success
    assert_select "title", "Stationery | Ruby on Rails Tutorial Sample App"
  end

  test "should get drink" do
    get :drink
    assert_response :success
    assert_select "title", "Drink | Ruby on Rails Tutorial Sample App"
  end

  test "should get noodle" do
    get :noodle
    assert_response :success
    assert_select "title",  "Noodle | Ruby on Rails Tutorial Sample App"
  end

  test "should get bread" do
    get :bread
    assert_response :success
    assert_select "title", "Bread | Ruby on Rails Tutorial Sample App"
  end

  test "should get lunch" do
    get :lunch
    assert_response :success
    assert_select "title", "Lunch | Ruby on Rails Tutorial Sample App"
  end

end

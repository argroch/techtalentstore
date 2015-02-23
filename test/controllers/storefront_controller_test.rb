require 'test_helper'

class StorefrontControllerTest < ActionController::TestCase
  test "should get all_item" do
    get :all_item
    assert_response :success
  end

  test "should get items_by_category" do
    get :items_by_category
    assert_response :success
  end

  test "should get items_by_brand" do
    get :items_by_brand
    assert_response :success
  end

end

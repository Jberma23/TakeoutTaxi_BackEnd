require 'test_helper'

class LocationControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get location_create_url
    assert_response :success
  end

  test "should get index" do
    get location_index_url
    assert_response :success
  end

  test "should get new" do
    get location_new_url
    assert_response :success
  end

end

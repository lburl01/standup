require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "should get root" do
    get root_path
    assert_response :success
  end

  # test "authenticated root should be bulbs#index" do
  #
  #   get root_path
  #   assert_response :success
  # end

  test "should get user home" do
    get users_home_path
    assert_response :success
  end

  test "should get all bulbs" do
    get bulbs_index_path
    assert_response :success
  end

end

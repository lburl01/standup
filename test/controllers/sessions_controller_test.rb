require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bulbs_index_path
    assert_response :success
  end

end

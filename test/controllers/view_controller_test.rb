require "test_helper"

class ViewControllerTest < ActionDispatch::IntegrationTest
  test "should get reportindex" do
    get view_reportindex_url
    assert_response :success
  end
end

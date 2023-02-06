require "test_helper"

class FollowRelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get followings" do
    get follow_relationships_followings_url
    assert_response :success
  end

  test "should get followers" do
    get follow_relationships_followers_url
    assert_response :success
  end
end

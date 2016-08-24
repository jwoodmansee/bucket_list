require 'test_helper'

class BucketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buckets_index_url
    assert_response :success
  end

  test "should get new" do
    get buckets_new_url
    assert_response :success
  end

  test "should get show" do
    get buckets_show_url
    assert_response :success
  end

  test "should get edit" do
    get buckets_edit_url
    assert_response :success
  end

end

require 'test_helper'

class FilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get files_index_url
    assert_response :success
  end

  test "should get new" do
    get files_new_url
    assert_response :success
  end

  test "should get create" do
    get files_create_url
    assert_response :success
  end

  test "should get destroy" do
    get files_destroy_url
    assert_response :success
  end

end

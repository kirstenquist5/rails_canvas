require 'test_helper'

class EnrollmentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get enrollment_index_url
    assert_response :success
  end

  test "should get new" do
    get enrollment_new_url
    assert_response :success
  end

end

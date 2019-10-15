require 'test_helper'

class FixpointAttachmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get fixpoint_attachments_new_url
    assert_response :success
  end

  test "should get create" do
    get fixpoint_attachments_create_url
    assert_response :success
  end

  test "should get edit" do
    get fixpoint_attachments_edit_url
    assert_response :success
  end

  test "should get update" do
    get fixpoint_attachments_update_url
    assert_response :success
  end

  test "should get destroy" do
    get fixpoint_attachments_destroy_url
    assert_response :success
  end

end

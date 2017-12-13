require 'test_helper'

class OutingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @outing = outings(:one)
    sign_in users(:admin_user)
  end

  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should get new" do
    get new_outing_url
    assert_response :success
  end

  test "should create outing" do
    assert_difference('Outing.count') do
      post outings_url, params: { outing: { day: @outing.day, location_id: @outing.location_id, time: @outing.time } }
    end

    assert_redirected_to outing_url(Outing.last)
  end

  test "should not create outing" do
    assert_no_difference('Outing.count') do
      post outings_url, params: { outing: { day: '', location_id: @outing.location_id, time: @outing.time } }
    end
  end

  test "should show outing" do
    get outing_url(@outing)
    assert_response :success
  end

  test "should get edit" do
    get edit_outing_url(@outing)
    assert_response :success
  end

  test "should update outing" do
    patch outing_url(@outing), params: { outing: { day: @outing.day, location_id: @outing.location_id, time: @outing.time } }
    assert_redirected_to outing_url(@outing)
  end

  test "should destroy outing" do
    assert_difference('Outing.count', -1) do
      delete outing_url(@outing)
    end

    assert_redirected_to root_path
  end
end
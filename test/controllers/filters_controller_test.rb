require 'test_helper'

class FiltersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @filter = filters(:one)
    sign_in users(:admin_user)
  end

  test "should get index" do
    get filters_url
    assert_response :success
  end

  test "should get new" do
    get new_filter_url
    assert_response :success
  end

  test "should create filter" do
    assert_difference('Filter.count') do
      post filters_url, params: { filter: { brand: @filter.brand, description: @filter.description, name: @filter.name, notes: @filter.notes } }
    end

    assert_redirected_to filter_url(Filter.last)
  end

  test "should not create filter" do
    assert_no_difference('Filter.count') do
      post filters_url, params: { filter: { description: @filter.description, name: @filter.name, notes: @filter.notes } }
    end
  end

  test "should show filter" do
    get filter_url(@filter)
    assert_response :success
  end

  test "should get edit" do
    get edit_filter_url(@filter)
    assert_response :success
  end

  test "should update filter" do
    patch filter_url(@filter), params: { filter: { brand: @filter.brand, description: @filter.description, name: @filter.name, notes: @filter.notes } }
    assert_redirected_to filter_url(@filter)
  end

  test "should destroy filter" do
    assert_difference('Filter.count', -1) do
      delete filter_url(@filter)
    end

    assert_redirected_to filters_url
  end
end

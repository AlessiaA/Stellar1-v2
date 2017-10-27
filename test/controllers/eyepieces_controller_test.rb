require 'test_helper'

class EyepiecesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @eyepiece = eyepieces(:one)
    sign_in users(:admin_user)
  end

  test "should get index" do
    get eyepieces_url
    assert_response :success
  end

  test "should get new" do
    get new_eyepiece_url
    assert_response :success
  end

  test "should create eyepiece" do
    assert_difference('Eyepiece.count') do
      post eyepieces_url, params: { eyepiece: { apparent_fov: @eyepiece.apparent_fov, brand: @eyepiece.brand, description: @eyepiece.description, focal_length: @eyepiece.focal_length, name: @eyepiece.name, notes: @eyepiece.notes, ocular: @eyepiece.ocular, size: @eyepiece.size } }
    end

    assert_redirected_to eyepiece_url(Eyepiece.last)
  end

  test "should not create eyepiece" do
    assert_no_difference('Eyepiece.count') do
      post eyepieces_url, params: { eyepiece: { apparent_fov: @eyepiece.apparent_fov, brand: @eyepiece.brand, description: @eyepiece.description, focal_length: '', name: @eyepiece.name, notes: @eyepiece.notes, ocular: @eyepiece.ocular, size: @eyepiece.size } }
    end
  end

  test "should show eyepiece" do
    get eyepiece_url(@eyepiece)
    assert_response :success
  end

  test "should get edit" do
    get edit_eyepiece_url(@eyepiece)
    assert_response :success
  end

  test "should update eyepiece" do
    patch eyepiece_url(@eyepiece), params: { eyepiece: { apparent_fov: @eyepiece.apparent_fov, brand: @eyepiece.brand, description: @eyepiece.description, focal_length: @eyepiece.focal_length, name: @eyepiece.name, notes: @eyepiece.notes, ocular: @eyepiece.ocular, size: @eyepiece.size } }
    assert_redirected_to eyepiece_url(@eyepiece)
  end

  test "should destroy eyepiece" do
    assert_difference('Eyepiece.count', -1) do
      delete eyepiece_url(@eyepiece)
    end

    assert_redirected_to eyepieces_url
  end
end

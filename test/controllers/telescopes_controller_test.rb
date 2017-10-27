require 'test_helper'

class TelescopesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @telescope = telescopes(:one)
    sign_in users(:admin_user)
  end

  test "should get index" do
    get telescopes_url
    assert_response :success
  end

  test "should get new" do
    get new_telescope_url
    assert_response :success
  end

  test "should create telescope" do
    assert_difference('Telescope.count') do
      post telescopes_url, params: { telescope: { angular_resolution: @telescope.angular_resolution, aperture: @telescope.aperture, brand: @telescope.brand, description: @telescope.description, finderscope: @telescope.finderscope, focal_length: @telescope.focal_length, focal_ratio: @telescope.focal_ratio, magnitude: @telescope.magnitude, mount: @telescope.mount, name: @telescope.name, notes: @telescope.notes, typology: @telescope.typology } }
    end

    assert_redirected_to telescope_url(Telescope.last)
  end

  test "should not create telescope" do
    assert_no_difference('Telescope.count') do
      post telescopes_url, params: { telescope: { angular_resolution: '', aperture: @telescope.aperture, brand: @telescope.brand, description: @telescope.description, finderscope: @telescope.finderscope, focal_length: @telescope.focal_length, focal_ratio: @telescope.focal_ratio, magnitude: @telescope.magnitude, mount: @telescope.mount, name: @telescope.name, notes: @telescope.notes, typology: @telescope.typology } }
    end
  end

  test "should show telescope" do
    get telescope_url(@telescope)
    assert_response :success
  end

  test "should get edit" do
    get edit_telescope_url(@telescope)
    assert_response :success
  end

  test "should update telescope" do
    patch telescope_url(@telescope), params: { telescope: { angular_resolution: @telescope.angular_resolution, aperture: @telescope.aperture, brand: @telescope.brand, description: @telescope.description, finderscope: @telescope.finderscope, focal_length: @telescope.focal_length, focal_ratio: @telescope.focal_ratio, magnitude: @telescope.magnitude, mount: @telescope.mount, name: @telescope.name, notes: @telescope.notes, typology: @telescope.typology } }
    assert_redirected_to telescope_url(@telescope)
  end

  test "should destroy telescope" do
    assert_difference('Telescope.count', -1) do
      delete telescope_url(@telescope)
    end

    assert_redirected_to telescopes_url
  end
end

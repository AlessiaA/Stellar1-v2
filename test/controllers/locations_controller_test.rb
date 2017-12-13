require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @location = locations(:one)
    sign_in users(:admin_user)
  end

 
  test "should get index" do
    get locations_url
    assert_response :success
  end

  # raggiungibilità pagina della creazione
  test "should get new" do
    get new_location_url
    assert_response :success
  end


  test "should create location" do
    assert_difference('Location.count') do
      post locations_url, params: { location: { name: @location.name, latitude: @location.latitude, altitude: @location.altitude, bortle: @location.bortle, sqm: @location.sqm } }
    end

    assert_redirected_to location_url(Location.last)
  end


  test "should not create location" do
    assert_no_difference('Location.count') do
      post locations_url, params: { location: { name: '', latitude: @location.latitude, altitude: @location.altitude, bortle: @location.bortle, sqm: @location.sqm  } }
    end
  end
  

  test "should show location" do
    get location_url(@location)
    assert_response :success
  end

  # raggiungibilità pagina per la modifica
  test "should get edit" do
    get edit_location_url(@location)
    assert_response :success
  end


  test "should update location" do
    patch location_url(@location), params: { location: { name: @location.name, latitude: @location.latitude, altitude: @location.altitude, bortle: @location.bortle, sqm: @location.sqm  } }
    assert_redirected_to location_url(@location)
  end

 
  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete location_url(@location)
    end

    assert_redirected_to locations_url
  end
end

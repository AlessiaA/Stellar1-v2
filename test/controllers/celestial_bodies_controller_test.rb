require 'test_helper'

class CelestialBodiesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @celestial_body = celestial_bodies(:one)
    sign_in users(:admin_user)
  end

  # raggiungibilità della pagina
  test "should get index" do
    get celestial_bodies_url
    assert_response :success
  end

  # raggiungibilità della pagina per l'inserimento
  test "should get new" do
    get new_celestial_body_url
    assert_response :success
  end

  # creazione corpo celeste
  test "should create celestial_body" do
    assert_difference('CelestialBody.count') do
      post celestial_bodies_url, params: { celestial_body: { constellation: @celestial_body.constellation, map_chart_number: @celestial_body.map_chart_number, name: @celestial_body.name, size: @celestial_body.size, typology: @celestial_body.typology } }
    end

    assert_redirected_to celestial_body_url(CelestialBody.last)
  end

  # visualizzazione dettagli corpo celeste
  test "should show celestial_body" do
    get celestial_body_url(@celestial_body)
    assert_response :success
  end

  test "should get edit" do
    get edit_celestial_body_url(@celestial_body)
    assert_response :success
  end

  # aggiornamento corpo celeste
  test "should update celestial_body" do
    patch celestial_body_url(@celestial_body), params: { celestial_body: { constellation: @celestial_body.constellation, map_chart_number: @celestial_body.map_chart_number, name: @celestial_body.name, size: @celestial_body.size, typology: @celestial_body.typology } }
    assert_redirected_to celestial_body_url(@celestial_body)
  end

  # cancellazione corpo celeste
  test "should destroy celestial_body" do
    assert_difference('CelestialBody.count', -1) do
      delete celestial_body_url(@celestial_body)
    end

    assert_redirected_to celestial_bodies_url
  end
end

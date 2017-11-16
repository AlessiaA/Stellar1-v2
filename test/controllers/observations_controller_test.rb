require 'test_helper'

class ObservativesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @observation = observations(:one)
    sign_in users(:admin_user)
  end

  # raggiungibilità pagina
  test "should get index" do
    get observative_sessions_url
    assert_response :success
  end

  # raggiungibilità pagina inserimento
  test "should get new" do
    get new_observation_url
    assert_response :success
  end

  # creazione osservazione
  test "should create observation" do
    assert_difference('Observation.count') do
      post observations_url, params: { observation: { start_time: @observation.start_time, description: @observation.description, rating: @observation.rating, notes: @observation.notes, celestial_body_name: @observation.celestial_body_name, telescope_name: @observation.telescope_name, binocular_name: @observation.binocular_name, eyepiece_name: @observation.eyepiece_name, filter_name: @observation.filter_name, user_id: @observation.user_id, observative_session_id: @observation.observative_session_id } }
    end

    assert_redirected_to observation_url(Observation.last)
  end

  # visualizzazione dettagli osservazione
  test "should show observation" do
    get observation_url(@observation)
    assert_response :success
  end

  test "should get edit" do
    get edit_observation_url(@observation)
    assert_response :success
  end

  # aggiornamento osservazione
  test "should update observation" do
    patch observation_url(@observation), params: { observation: { start_time: @observation.start_time, description: @observation.description, rating: @observation.rating, notes: @observation.notes, celestial_body_name: @observation.celestial_body_name, telescope_name: @observation.telescope_name, binocular_name: @observation.binocular_name, eyepiece_name: @observation.eyepiece_name, filter_name: @observation.filter_name, user_id: @observation.user_id, observative_session_id: @observation.observative_session_id } }
    assert_redirected_to observation_url(@observation)
  end

  # cancellazione osservazione
  test "should destroy observation" do
    assert_difference('Observation.count', -1) do
      delete observation_url(@observation)
    end

    assert_redirected_to observative_sessions_url
  end
end

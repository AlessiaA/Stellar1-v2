require 'test_helper'

class ObservationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
	@observative_session = observative_sessions(:one)
    @observation = observations(:two)
    sign_in users(:admin_user)
  end

  # raggiungibilità pagina inserimento
  test "should get new" do
    get new_observative_session_observation_path(@observative_session)
    assert_response :success
  end

  # creazione osservazione
  test "should create observation" do
    assert_difference('Observation.count') do
      post observative_session_observations_path(@observative_session), params: { observation: { start_time: @observation.start_time, description: @observation.description, rating: @observation.rating, notes: @observation.notes, celestial_body_name: @observation.celestial_body_name, telescope_name: @observation.telescope_name, binocular_name: @observation.binocular_name, eyepiece_name: @observation.eyepiece_name, filter_name: @observation.filter_name, user_id: @observation.user_id, observative_session_id: @observation.observative_session_id }}
    end

    assert_redirected_to observative_session_observation_url(@observative_session, Observation.last)
  end
  
   test "should not create observation" do
    assert_no_difference('Observation.count') do
      post observative_session_observations_path(@observative_session), params: { observation: { start_time: @observation.start_time, description: @observation.description, rating: @observation.rating, notes: @observation.notes, celestial_body_name: '', telescope_name: @observation.telescope_name, binocular_name: @observation.binocular_name, eyepiece_name: @observation.eyepiece_name, filter_name: @observation.filter_name, user_id: @observation.user_id, observative_session_id: @observation.observative_session_id } }
    end
  end

  # visualizzazione dettagli osservazione
  test "should show observation" do
    get observative_session_observation_path(@observation.observative_session_id, @observation.id)
    assert_response :success
  end

  test "should get edit" do
    get edit_observative_session_observation_url(@observative_session, @observation)
    assert_response :success
  end

  # aggiornamento osservazione
  test "should update observation" do
    patch observative_session_observation_url(@observation.observative_session_id, @observation.id), params: { observation: { start_time: @observation.start_time, description: @observation.description, rating: @observation.rating, notes: @observation.notes, celestial_body_name: @observation.celestial_body_name, telescope_name: @observation.telescope_name, binocular_name: @observation.binocular_name, eyepiece_name: @observation.eyepiece_name, filter_name: @observation.filter_name, user_id: @observation.user_id, observative_session_id: @observation.observative_session_id } }
    assert_redirected_to observative_session_observation_url(@observative_session, @observation)
  end

  # cancellazione osservazione
  test "should destroy observation" do
    assert_difference('Observation.count', -1) do
      delete observative_session_observation_url(@observation.observative_session_id, @observation.id)
    end

    assert_redirected_to observative_session_url(@observation.observative_session_id)
  end
end

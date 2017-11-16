require 'test_helper'

class ObservativeSessionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @observative_session = observative_sessions(:one)
    sign_in users(:admin_user)
  end

  # raggiungibilità pagina
  test "should get index" do
    get root_path
    assert_response :success
  end

  # raggiungibilità pagina inserimento
  test "should get new" do
    get new_observative_session_url
    assert_response :success
  end

  # creazione sessione osservativa
  test "should create observative_session" do
    assert_difference('ObservativeSession.count') do
      post observative_sessions_url, params: { observative_session: { antoniadi: @observative_session.antoniadi, pickering: @observative_session.pickering, bortle: @observative_session.bortle, sqm: @observative_session.sqm, date: @observative_session.date, start: @observative_session.start, end: @observative_session.end, name: @observative_session.name, latitude: @observative_session.latitude, longitude: @observative_session.longitude, altitude: @observative_session.altitude, completed: @observative_session.completed, notes: @observative_session.notes, sky_transparency: @observative_session.sky_transparency, user_id: @observative_session.user_id } }
    end

    assert_redirected_to observative_session_url(ObservativeSession.last)
  end

  # visualizzazione dettagli sessione osservativa
  test "should show observative_session" do
    get observative_session_url(@observative_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_observative_session_url(@observative_session)
    assert_response :success
  end

  # aggiornamento sessione osservativa
  test "should update observative_session" do
    patch observative_session_url(@observative_session), params: { observative_session: { antoniadi: @observative_session.antoniadi, pickering: @observative_session.pickering, bortle: @observative_session.bortle, sqm: @observative_session.sqm, date: @observative_session.date, start: @observative_session.start, end: @observative_session.end, name: @observative_session.name, latitude: @observative_session.latitude, longitude: @observative_session.longitude, altitude: @observative_session.altitude, completed: @observative_session.completed, notes: @observative_session.notes, sky_transparency: @observative_session.sky_transparency, user_id: @observative_session.user_id } }
    assert_redirected_to observative_session_url(@observative_session)
  end

  # cancellazione sessione osservativa
  test "should destroy observative_session" do
    assert_difference('ObservativeSession.count', -1) do
      delete observative_session_url(@observative_session)
    end

    assert_redirected_to root_path
  end
end

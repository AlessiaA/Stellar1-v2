require 'test_helper'

class ObservativeSessionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @observative_session = observative_sessions(:one)
    sign_in users(:admin_user)
  end

  # raggiungibilità pagina
  test "should get index" do
    get observative_sessions_url
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
      post observative_sessions_url, params: { observative_session: { antoniadi: @observative_session.antoniadi, category: @observative_session.category, end: @observative_session.end, name: @observative_session.name, pickering: @observative_session.pickering, sky_transparency: @observative_session.sky_transparency, start: @observative_session.start, user_id: @observative_session.user_id } }
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
    patch observative_session_url(@observative_session), params: { observative_session: { antoniadi: @observative_session.antoniadi, category: @observative_session.category, end: @observative_session.end, name: @observative_session.name, pickering: @observative_session.pickering, sky_transparency: @observative_session.sky_transparency, start: @observative_session.start } }
    assert_redirected_to observative_session_url(@observative_session)
  end

  # cancellazione sessione osservativa
  test "should destroy observative_session" do
    assert_difference('ObservativeSession.count', -1) do
      delete observative_session_url(@observative_session)
    end

    assert_redirected_to observative_sessions_url
  end
end

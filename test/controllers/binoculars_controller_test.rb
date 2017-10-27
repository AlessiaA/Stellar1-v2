require 'test_helper'

class BinocularsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @binocular = binoculars(:one)
    sign_in users(:admin_user)
  end

  # TEST 3.1
  test "should get index" do
    get binoculars_url
    assert_response :success
  end

  # raggiungibilità pagina della creazione
  test "should get new" do
    get new_binocular_url
    assert_response :success
  end

  # TEST 3.2
  test "should create binocular" do
    assert_difference('Binocular.count') do
      post binoculars_url, params: { binocular: { brand: @binocular.brand, description: @binocular.description, magnifications: @binocular.magnifications, name: @binocular.name, notes: @binocular.notes } }
    end

    assert_redirected_to binocular_url(Binocular.last)
  end

  # TEST 3.3
  test "should not create binocular" do
    assert_no_difference('Binocular.count') do
      post binoculars_url, params: { binocular: { brand: @binocular.brand, description: @binocular.description, magnifications: '', name: @binocular.name, notes: @binocular.notes } }
    end
  end
  
  # TEST 3.5
  test "should show binocular" do
    get binocular_url(@binocular)
    assert_response :success
  end

  # TEST 3.6 (raggiungibilità pagina per la modifica)
  test "should get edit" do
    get edit_binocular_url(@binocular)
    assert_response :success
  end

  # TEST 3.6
  test "should update binocular" do
    patch binocular_url(@binocular), params: { binocular: { brand: @binocular.brand, description: @binocular.description, magnifications: @binocular.magnifications, name: @binocular.name, notes: @binocular.notes } }
    assert_redirected_to binocular_url(@binocular)
  end

  # TEST 3.7
  test "should destroy binocular" do
    assert_difference('Binocular.count', -1) do
      delete binocular_url(@binocular)
    end

    assert_redirected_to binoculars_url
  end
end

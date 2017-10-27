require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = users(:admin_user)
    @simple_user = users :simple_user
  end

  # TEST 1.1
  test "user wrong authentication" do
    visit user_session_path

    fill_in "Email", with: "inesistente@mail.com"
    fill_in "Password", with: "errato"

    click_on "Accedi"

    assert_text "Invalid Email or password."
  end

  # TEST 1.2
  test "admin successful authentication" do
    visit user_session_path

    assert page.has_field?('Email', type: 'email')
    assert page.has_field?('Password', type: 'password')

    fill_in "Email", with: @admin.email
    fill_in "Password", with: "adminadmin"
    click_on "Accedi"

    sign_in @admin
    visit root_path

    assert_text "Gestione utenti"
    assert page.has_link?('Logout')
  end

  # TEST 1.4
  test "system logout" do
    sign_in @admin
    visit root_path

    assert page.has_link?('Logout')
    click_link "Logout"

    assert_text "È necessario accedere con le proprie credenziali o iscriversi prima di poter continuare."
  end

  # TEST 2.2
  test "users list rendering" do
    sign_in @admin
    visit root_path

    assert_text "Gestione utenti"
    assert_text "Lista membri iscritti"

    assert page.has_content?(@simple_user.email)
  end

end

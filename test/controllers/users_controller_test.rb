require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
  
    setup do
        @user = users(:simple_user)
        sign_in users(:admin_user)
    end

    # TEST 2.1
    test "should get index" do
        get root_path
        assert_response :success
    end

    # TEST 2.3
    test "should create user" do
        assert_difference('User.count') do
            post users_url, params: { user: { email: "ex@mail.com", name: "Mark", surname: "Bale", 
            birth: @user.birth, subscription_expiration: @user.subscription_expiration, password: "password"} }
        end

        assert_redirected_to root_path
    end

    # TEST 2.4
    test "should not create user" do
        assert_no_difference('User.count') do
            post users_url, params: { user: { email: "dddd", name: "Mark", surname: "Bale", 
            birth: @user.birth, subscription_expiration: @user.subscription_expiration, password: "password"} }
        end
    end
end

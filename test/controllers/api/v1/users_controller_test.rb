require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = users(:one)
  end

  #Verifies acess to the User#show method
  test "should show user" do
      get api_v1_user_url(@user), as: :json
      assert_response :success
      # Test to ensure response contains the correct email
      json_response = JSON.parse(self.response.body)
      assert_equal @user.email, json_response['email']
  end

  #We check the creation of a user by sending a valid POST requets
  #Then we check that an additional user exists in the database and that 
  #the HTTP code of the responde is created (Status code 201)
  test "should create user" do 
    assert_difference('User.count') do
      post api_v1_users_url, params: { user: { email: 'test@test.org', password: '123456' } }, as: :json
    end
    assert_response :created 
  end

  #We check that the user is not created using and email already used
  #HTTP code of the response is unprocessable_entitiy (status code 422)
  test "should not create user with taken email" do 
    assert_no_difference('User.count') do
      post api_v1_users_url, params: { user: { email: @user .email, password: '123456' } }, as: :json
  end
  assert_response :unprocessable_entity end
end

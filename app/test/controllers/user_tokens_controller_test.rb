require 'test_helper'

class UserTokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_token = user_tokens(:one)
  end

  test "should get index" do
    get user_tokens_url, as: :json
    assert_response :success
  end

  test "should create user_token" do
    assert_difference('UserToken.count') do
      post user_tokens_url, params: { user_token: { divice_token: @user_token.divice_token, user_id: @user_token.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show user_token" do
    get user_token_url(@user_token), as: :json
    assert_response :success
  end

  test "should update user_token" do
    patch user_token_url(@user_token), params: { user_token: { divice_token: @user_token.divice_token, user_id: @user_token.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy user_token" do
    assert_difference('UserToken.count', -1) do
      delete user_token_url(@user_token), as: :json
    end

    assert_response 204
  end
end

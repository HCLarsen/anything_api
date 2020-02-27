require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  def setup
    @sign_up_url = '/api/v1/auth/'
    @signup_params = {
        email: 'john.doe@example.org',
        password: 'FakePassword123!',
        password_confirmation: 'FakePassword123!'
    }

    @sign_in_url = '/api/v1/auth/sign_in'
    @sign_out_url = '/api/v1/auth/sign_out'
    @login_params = {
      email: 'john.doe@example.org',
      password: 'FakePassword123!',
    }
  end

  test "should register and allow login" do
    post @sign_up_url, params: @signup_params
    assert_response :success

    post @sign_in_url, params: @login_params
    assert_response :success
    assert response.headers['access-token']
  end
end

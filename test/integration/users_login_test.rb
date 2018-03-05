require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new email: users(:bob).email, password: 'secret',
      password_confirmation: 'secret'
  end

  test 'login with invalid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: '', password: '' } }
    assert_template 'sessions/new'
    get root_path
    # Add assertions for error messages
  end

  test 'login with valid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @user.email, password: @user.password,
      password_confirmation: @user.password } }
    follow_redirect!
    assert is_logged_in?
    assert_template 'users/account'
    # Add assertions for header change
  end
end

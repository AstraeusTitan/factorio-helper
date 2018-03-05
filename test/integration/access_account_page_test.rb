require 'test_helper'

class AccessAccountPageTest < ActionDispatch::IntegrationTest
  test 'access account page without login' do
    get account_path
    follow_redirect!
    assert_template 'sessions/new'
  end
end

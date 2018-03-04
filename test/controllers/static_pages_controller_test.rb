require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get root' do
    get root_path
    assert_response :success
  end

  test 'should get welcome' do
    get welcome_path
    assert_response :success
    assert_select 'title', 'Welcome | Factorio Helper'
  end

end

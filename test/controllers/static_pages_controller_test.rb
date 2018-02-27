require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get root' do
    get root_path
    assert_response :success
  end

  test 'should get home' do
    get home_path
    assert_response :success
    assert_select 'title', 'Home | Factorio Helper'
  end

end

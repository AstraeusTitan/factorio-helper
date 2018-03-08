require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test 'should get browse page' do
    get browse_path
    assert_response :success
    log_in_as users :bob
    get browse_path
    assert_response :success
  end
end

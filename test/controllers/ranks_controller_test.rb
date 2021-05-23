require 'test_helper'

class RanksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ranks_index_url
    assert_response :success
  end

end

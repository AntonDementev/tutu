require 'test_helper'

class TrainControllerTest < ActionDispatch::IntegrationTest
  test "should get number" do
    get train_number_url
    assert_response :success
  end

end

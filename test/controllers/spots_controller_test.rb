require 'test_helper'

class SpotsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @spot = spots(:one)
    @other_spot = spots(:two)
  end
  
  test "should get index" do
    get spots_path
    assert_response :success
  end

  test "should get show" do
    get spot_path(@spot)
    assert_response :success
  end

end

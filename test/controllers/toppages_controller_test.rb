require 'test_helper'

class ToppagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Toku-Toku"  
  end
  
  test "should get index" do
    get root_path
    assert_response :success
    assert_select "title", "Toppage | #{@base_title}"
  end

end

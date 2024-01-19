require 'test_helper'

class Api::MoviesControllerTest < ActionDispatch::IntegrationTest
  describe "gome page" do
    it "can see the welcome page" do
      get api_movies_path
      
      assert_equal json_response['movies'].length, 1
    end
  end
end

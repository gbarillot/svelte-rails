require 'test_helper'

class Api::MoviesControllerTest < ActionDispatch::IntegrationTest
  describe "Home page" do
    it "returns an array of movies" do
      get api_movies_path
      
      assert_equal json_response['movies'].length, 2
    end
  end
end

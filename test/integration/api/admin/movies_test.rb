require 'test_helper'

class Api::Admin::MoviesControllerTest < ActionDispatch::IntegrationTest
  describe "when not authenticated" do
    it "returns a status 401" do
      get api_admin_movies_path
      
      assert_equal 401, response.status
    end
  end 

  describe "when is authenticated" do
    let(:movies) { {"movies" => 2} }

    before do
      sign_in users(:admin)
    end

    it "returns an array of movies" do
      get api_admin_movies_path
      
      assert_not_empty json_response['movies']
    end

    describe "pagination" do
      it "returns 1 result" do
        n = 1
        get api_admin_movies_path, params: {per: n}
        
        assert_equal n, json_response['movies'].length
      end

      it "returns 2 results per page" do
        n = 2
        get api_admin_movies_path, params: {per: n}
        
        assert_equal n, json_response['movies'].length
      end 
    end

    describe "search filters" do 
      let(:movie) { Movie.find_by(name: 'first movie') } 

      it "returns valid response" do
        get api_admin_movies_path, params: {'q[name_cont]' => 'first'}
       
        assert_equal 1, json_response['movies'].length
        assert_equal movie.name, json_response['movies'].first['name']
      end 
    end
  end 
end

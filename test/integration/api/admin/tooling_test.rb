require 'test_helper'

class Api::Admin::ToolingControllerTest < ActionDispatch::IntegrationTest
  describe "when not authenticated" do
    it "returns a status 401" do
      get api_admin_tooling_index_path
      
      assert_equal 401, response.status
    end
  end 

  describe "when is authenticated" do
    let(:metrics) { {"movies" => 2} }

    before do
      sign_in users(:admin)
    end

    it "returns metrics" do
      get api_admin_tooling_index_path
      
      assert_equal metrics, json_response['metrics']
    end
  end   
end

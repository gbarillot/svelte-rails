ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "minitest/autorun"
require "minitest/spec"

include Rails.application.routes.url_helpers
include ActionDispatch::TestProcess
include Warden::Test::Helpers

Rails.logger.level = 5

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: 1)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    def json_response
      ActiveSupport::JSON.decode(response.body)
    end
  end
end

class ActionController::TestCase
  include Rails.application.routes.url_helpers
  include Devise::Test::ControllerHelpers
  include ActionCable::TestHelper
end

class ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers
  include Devise::Test::IntegrationHelpers 
end
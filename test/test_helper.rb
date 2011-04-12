ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'mocha'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting

  # Add more helper methods to be used by all tests here...

  setup { Sham.reset }
end

require File.expand_path(File.dirname(__FILE__) + "/blueprints")

require 'capybara/rails'

class ActionDispatch::IntegrationTest
 include Capybara
end

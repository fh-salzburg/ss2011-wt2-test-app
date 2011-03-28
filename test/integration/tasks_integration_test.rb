require 'test_helper'

class TasksIntegrationTest < ActionDispatch::IntegrationTest
  test "show tasks" do
    get '/tasks'
    assert_response :success
  end
end

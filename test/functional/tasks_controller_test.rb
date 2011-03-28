require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  test "index" do
    get :index
    assert_response :success
  end
end

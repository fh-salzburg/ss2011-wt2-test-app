require 'test_helper'

class TasksIntegrationTest < ActionDispatch::IntegrationTest
  should "show tasks" do
    Task.make(:title => "first task")
    Task.make(:title => "second task")
    get '/tasks'
    assert_response :success
    # checking the html structure
    assert_select 'ul#tasks li', 2
    # or just checking the content
    assert_match "first task", response.body
    assert_match "second task", response.body
  end
end

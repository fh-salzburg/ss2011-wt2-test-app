require 'test_helper'

class TasksIntegrationTest < ActionDispatch::IntegrationTest
  should "show tasks" do
    Task.make(:title => "first task")
    Task.make(:title => "second task")
    visit '/tasks'
    # checking the html structure
    assert page.has_css?('ul#tasks li', :count => 2)
    # or just checking the content
    assert page.has_content?("first task")
    assert page.has_content?("second task")
  end

  should "create task" do
    visit tasks_path
    click_link "Neuer Task"
    fill_in "Titel", :with => "My Task"
    select "2", :from => "Geschätzte Dauer"

    assert_difference("Task.count") do
      click_button "Abschicken"
    end

    assert page.has_css?('ul#tasks li', :count => 1)
    assert page.has_content?('My Task')
  end
end

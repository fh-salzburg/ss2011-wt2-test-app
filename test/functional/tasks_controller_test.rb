require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  should "get :index" do
    @task_1 = Task.make
    @task_2 = Task.make

    get :index
    assert_response :success

    # assert_same_elements ist eine Shoulda-Assertion
    # sie vergleicht, ob die selben Elemente enthalten sind
    # dabei kommt es im Gegensatz zu assert_equal nicht auf die Reihenfolge an
    assert_same_elements [ @task_1, @task_2 ], assigns(:tasks)

    assert_select "ul#tasks li", 2
  end
end

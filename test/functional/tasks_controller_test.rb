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

  context "new" do
    setup do
      get :new
    end

    should respond_with(:success)
  end

  context "create" do
    setup do
      # plan ist eine Machinist-Methode, die die notwendigen Parameter für das
      # Anlegen eines Objektes zurückgibt, das Objekt aber nicht in der Datenbank anlegt
      post :create, :task => Task.plan
    end

    # respond_with ist einer der vielen Shoulda-Matcher
    # dabei wird ein Status überprüft, der durch das setup gesetzt wurde!
    should respond_with(:redirect)

    should "create a task" do
      assert_equal 1, Task.count
    end
  end
end

class TasksController < ApplicationController
  def index
   @tasks = Task.all
  end

  def new 
    @task = Task.new
  end 

  def create
    @task = Task.new(params[:task])

    if @task.save
      redirect_to tasks_path, :notice => "Task erfolgreich angelegt"
    else
      render 'new'
    end 
  end
end

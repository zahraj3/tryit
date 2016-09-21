class TaskController < ApplicationController

  def index
  	@tasks = Task.where(:parrent_id=> nil)
  end

  def new
  
  end

  def edit

  end

  def create
  	@task = Task.new task_params
  	@task.status = 1
    if @task.save
      redirect_to redirect_path, success: 'Task was successfully created.'
      return
    end

    render :new
  end

  def task_params
    params.require(:task).permit :title
  end

  def statistics
  
  end
  
  def redirect_path
    root_path
  end
end

class TaskController < ApplicationController
before_action :set_task, only: [:show, :destroy, :edit]

  def index
    @tasks = Task.where(:parrent_id=> nil)
  end

  def show
    @tasks = Task.where(:parrent_id=> params[:id])
    render :index
  end

  def new
  
  end

  def create
  	@task = Task.new task_params
  	@task.status = 1
    @task.parrent_id = params[:task][:parrent_id]
    if @task.save
     redirect_to action: "show", id: params[:task][:parrent_id]
    end
    
  end

  def destroy
    @subtasks = Task.where(:parrent_id=> params[:id])
    if @subtasks==[]
      @task.destroy
      redirect_to action: "show", id: @task.parrent_id, success: 'Task was successfully destroyed.'
    else
      redirect_to redirect_path, danger: 'Task can not be removed. There are exists some subtasks.'
    end
  end

  def edit
    
  end

  def task_params
    params.require(:task).permit :title
  end

  def statistics
  
  end
  
  def set_task
    @task = Task.find params[:id]
  end
  def redirect_path
    root_path
  end
end

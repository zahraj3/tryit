class TaskController < ApplicationController
before_action :set_task, only: [:show, :destroy, :edit]

  def index
    @task = Task.find(1)
    @tasks = Task.where("parrent_id= 1 AND id>1").order(:status)
    path_to_task
  end

  def show
    @tasks = Task.where(:parrent_id=> params[:id]).order(:status)
    path_to_task
    render :index
  end

  def new
  
  end

  def create
  	@task = Task.new task_params
  	@task.status = 1
    @task.parrent_id = params[:task][:parrent_id]
    if @task.save
      flash[:success] = "Task was successfully created."
      redirect_to action: "show", id: params[:task][:parrent_id]
    else
      redirect_to redirect_path, danger: 'Some parameters are missing.'
    end
  end

  def destroy
    @subtasks = Task.where(:parrent_id=> params[:id])
    if @subtasks==[]
      @task.destroy
      flash[:success] = "Task was successfully destroyed."
      redirect_to action: "show", id: @task.parrent_id
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

  def path_to_task
    id = @task.id
    title = @task.title
    @parrent_path = Array.new
    
    begin 
      parrent_task = Task.find(id)
      @parrent_path.unshift([parrent_task.id.to_s, parrent_task.title])
      id = parrent_task.parrent_id
    end while id > 0
  end

  def set_task
    @task = Task.find params[:id]
  end

  def redirect_path
    root_path
  end
end

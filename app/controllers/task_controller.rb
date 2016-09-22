class TaskController < ApplicationController

  def index
    @tasks = Task.where(:parrent_id=> nil)
  end

  def show
    @task = Task.find params[:id]
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
      #redirect_to action: show, id: 3
     redirect_to action: "show", id: params[:task][:parrent_id]
      #redirect_to redirect_path, success: 'Task was successfully created.'
      #return
    end
    
  end

  def edit
    @task = Task.find params[:id]
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

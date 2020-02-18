class TasksController < ApplicationController

  def index
    @tasks = Task.includes(:user).order("created_at DESC")
  end

  def show
    root_path
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
       @tasks = Task.includes(:user).order("created_at DESC")
    else
      redirect_to root_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @tasks = Task.includes(:user).order("created_at DESC")
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    @tasks = Task.includes(:user).order("created_at DESC")
  end


  private
  def task_params
    params.require(:task).permit(:content).merge(user_id: current_user.id)
  end
end

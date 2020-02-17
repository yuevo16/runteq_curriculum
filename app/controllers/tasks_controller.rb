class TasksController < ApplicationController

  def index
    @tasks = Task.includes(:user).order("created_at DESC")
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
    else
      redirect_to root_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.save
  end


  private
  def task_params
    params.require(:task).permit(:content).merge(user_id: current_user.id)
  end
end

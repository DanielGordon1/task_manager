class TasksController < ApplicationController
  before_action :set_tasks, only: :index

  def index
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
      flash[:notice] = "Succesfully created a new task 💪."
    else
      set_tasks
      render :index
    end
  end

  def mark
    @task = Task.find(params[:id])
    @task.mark_as_done
    if @task.save
      redirect_to root_path
      flash[:notice] = "Succesfully completed this task ✅."
    else
      redirect_to root_path
      flash[:error] = @task.errors.full_messages.first
    end
  end

  private

  def set_tasks
    @completed_tasks, @uncompleted_tasks = Task.all.partition(&:done)
  end

  def task_params
    params.require(:task).permit(:action)
  end
end

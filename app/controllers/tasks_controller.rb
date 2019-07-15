class TasksController < ApplicationController
  before_action :set_tasks, only: :index

  def index
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      message = "Succesfully created a new task 💪."
      respond_to do |format|
        format.html {
          redirect_to root_path
          flash[:notice] = message
        }
        format.js { flash.now[:notice] = message }
      end
    else
      respond_to do |format|
        format.html {
          set_tasks
          render :index
        }
        format.js
      end
    end
  end

  def mark
    @task = Task.find(params[:id])
    @task.mark_as_completed
    if @task.errors.none? && @task.save
      message = "Succesfully completed this task ✅."
      respond_to do |format|
        format.html {
          flash[:notice] = message
          redirect_to root_path
        }
        format.js { flash.now[:notice] = message }
      end
    else
      message = @task.errors.full_messages.first
      respond_to do |format|
        format.html {
          flash[:alert] = message
          redirect_to root_path
        }
        format.js { flash[:alert] = message }
      end
    end
  end

  private

  def set_tasks
    @completed_tasks, @uncompleted_tasks = Task.desc.partition(&:completed)
  end

  def task_params
    params.require(:task).permit(:action)
  end
end

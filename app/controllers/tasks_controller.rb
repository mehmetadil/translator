class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_task, only: [:show]
  before_action :set_version_trackers, only: [:show]

  def show; end

  def mytasks
    @tasks = current_user.tasks
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_version_trackers
    @version_trackers = @task.version_trackers.order('created_at DESC')
  end
end

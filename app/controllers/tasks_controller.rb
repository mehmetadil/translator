class TasksController < ApplicationController
  before_action :set_task, only: [:show]
  before_action :set_version_trackers, onl: [:show]
  def show
  end

  def mytasks
    @tasks = Task.where(translator_id: current_user.id)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_version_trackers
    @version_trackers = @task.version_trackers.order("created_at DESC")
  end

end

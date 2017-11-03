class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_task, only: %i[show complete_translation deny_complete_request]
  before_action :set_version_trackers, only: [:show]

  def show
    redirect_to root_path unless user_authorized?
  end

  def mytasks
    @tasks = current_user.tasks
  end

  def complete_translation # TODO/ GUVENLIK ONLEMI AL
    @task.in_progress? ? @task.pending_approval! : @task.done!
    redirect_back(fallback_location: :back)
  end

  def deny_complete_request
    @task.in_progress!
    redirect_back(fallback_location: :back)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_version_trackers
    @version_trackers = @task.version_trackers.order('created_at DESC')
  end

  def user_authorized?
    current_user == @task.translator || (current_user == @task.owner)
  end
end

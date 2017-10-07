class TasksController < ApplicationController

  def mytasks
    @tasks = Task.where(user_id: current_user.id)
  end

  private

end

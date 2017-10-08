class TasksController < ApplicationController

  def mytasks
    @tasks = Task.where(translator_id: current_user.id)
  end

  private

end

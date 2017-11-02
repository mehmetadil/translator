module TasksHelper

  def task_belongs_to_user?(task, current_user)
    task.translator == current_user
  end
end

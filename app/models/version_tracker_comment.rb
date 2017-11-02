class VersionTrackerComment < ApplicationRecord
  belongs_to :user
  belongs_to :version_tracker

  acts_as_notifiable :users,
    targets: ->(version_tracker_comment, key) {
      ([version_tracker_comment.version_tracker.task.translator] +
       [version_tracker_comment.version_tracker.task.owner]).uniq
    },
    tracked: true,
    notifiable_path: :task_notifiable_path

  def task_notifiable_path
    task_path(self)
  end
end

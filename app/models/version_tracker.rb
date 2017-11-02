class VersionTracker < ApplicationRecord
  belongs_to :task
  has_many :version_tracker_materials, dependent: :destroy
  has_many :version_tracker_comments, dependent: :destroy
  accepts_nested_attributes_for :version_tracker_materials

  acts_as_notifiable :users,
    targets: ->(version_tracker, key) {
      ([version_tracker.task.translator] + [version_tracker.task.owner]).uniq  # İleride dizinin eleman sayısı artabilir.
    },
    tracked: true,
    notifiable_path: :task_notifiable_path

  def task_notifiable_path
    task_path(self)
  end
end

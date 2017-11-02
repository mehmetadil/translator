class Task < ApplicationRecord
  enum status: { in_progress: 0, done: 1, pending_approval: 2 }
  belongs_to :offer
  belongs_to :translated_article
  belongs_to :translator, foreign_key: 'translator_id', class_name: 'User'
  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'
  belongs_to :target_language, foreign_key: 'target_language_id', class_name: 'Language'
  belongs_to :source_language, foreign_key: 'source_language_id', class_name: 'Language'
  has_many :version_trackers, dependent: :destroy

  acts_as_notifiable :users,
    targets: ->(task, key) {
      ([task.translator] + [task.owner]).uniq  # İleride dizinin eleman sayısı artabilir.
    },
    tracked: true,
    notifiable_path: :task_notifiable_path

  def task_notifiable_path
    task_path(self)
  end
end

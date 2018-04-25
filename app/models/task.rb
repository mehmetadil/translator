class Task < ApplicationRecord
  extend Enumerize
  enumerize :status, in: { in_progress: 0, done: 1, pending_approval: 2 }
  belongs_to :offer
  belongs_to :translated_article
  belongs_to :translator, foreign_key: 'translator_id', class_name: 'User'
  belongs_to :owner, foreign_key: 'owner_id', class_name: 'User'
  belongs_to :target_language, foreign_key: 'target_language_id', class_name: 'Language'
  belongs_to :source_language, foreign_key: 'source_language_id', class_name: 'Language'
  has_many :version_trackers, dependent: :destroy
end

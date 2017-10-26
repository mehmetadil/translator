class Task < ApplicationRecord
  enum status: %i[in_progress done]
  belongs_to :offer
  belongs_to :translated_article
  belongs_to :translator, foreign_key: 'translator_id', primary_key: 'id', class_name: 'User'
  belongs_to :target_language, foreign_key: 'target_language_id', primary_key: 'id', class_name: 'Language'
  belongs_to :source_language, foreign_key: 'source_language_id', primary_key: 'id', class_name: 'Language'
  has_many :version_trackers
end

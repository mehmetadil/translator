class TranslateOrder < ApplicationRecord
  belongs_to :user
  belongs_to :article
  belongs_to :target_language, foreign_key: 'target_language_id', class_name: 'Language'
  belongs_to :source_language, foreign_key: 'source_language_id', class_name: 'Language'
  has_many :offers, dependent: :destroy
  validates_uniqueness_of :source_language_id, scope: :target_language_id
end

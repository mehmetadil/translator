class Task < ApplicationRecord
  belongs_to :offer
  belongs_to :translator, :foreign_key => :translator_id, :primary_key => :id, :class_name => 'User'
  belongs_to :article
  belongs_to :target_language, :foreign_key => :target_language_id, :primary_key => :id, :class_name => 'Language'
  belongs_to :source_language, :foreign_key => :source_language_id, :primary_key => :id, :class_name => 'Language'
end

class Language < ApplicationRecord
  has_many :tasks
  has_many :translated_articles
end

class Language < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :translated_articles, dependent: :destroy
end

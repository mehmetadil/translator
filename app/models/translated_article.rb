class TranslatedArticle < ApplicationRecord
  belongs_to :article
  belongs_to :language
  has_many :tasks, dependent: :destroy

  def self.exist?(article_id, language_id)
    TranslatedArticle.where(article_id: article_id, language_id: language_id).any?
  end
end

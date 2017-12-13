class TranslatedArticle < ApplicationRecord
  belongs_to :article
  belongs_to :language
  has_many :tasks, dependent: :destroy

  def self.check_if_translated_article_exist?(language_id)
    # Kod tekrarı?
    @translated_article = TranslatedArticle.find_by(language_id: language_id)
  end
end

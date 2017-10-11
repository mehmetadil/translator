class TranslatedArticle < ApplicationRecord
  belongs_to :article
  belongs_to :language
  has_many :tasks


  def self.check_if_translated_article_exist?(language_id)
    @translated_article = TranslatedArticle.where(language_id: language_id).first
  end
end

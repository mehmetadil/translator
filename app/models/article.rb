class Article < ApplicationRecord
  validates :name, :description, presence: true
  belongs_to :user
  belongs_to :language
  has_many :article_materials
  has_many :translate_orders
  has_many :translated_articles
  accepts_nested_attributes_for :article_materials

  def belongs_to_user?(current_user)
    user == current_user
  end
end

class Article < ApplicationRecord
  validates :name, :description, presence: true
  belongs_to :user
  belongs_to :language
  has_many :article_materials, dependent: :destroy
  has_many :translate_orders, dependent: :destroy
  has_many :translated_articles, dependent: :destroy
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :article_materials

  def belongs_to_user?(current_user)
    user == current_user
  end
end

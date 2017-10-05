class Article < ApplicationRecord
    belongs_to :user
    belongs_to :language
    has_many :article_materials
    validates :name, presence: true
end

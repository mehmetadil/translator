class Article < ApplicationRecord
    #validates :name, :user_id, presence: true
    belongs_to :user
    belongs_to :language
    has_many :offers
    has_many :article_materials
    accepts_nested_attributes_for :article_materials
end

class Article < ApplicationRecord
    #validates :name, :user_id, presence: true
    belongs_to :user
    belongs_to :language
    has_many :article_materials
    has_many :translate_orders
    accepts_nested_attributes_for :article_materials
end

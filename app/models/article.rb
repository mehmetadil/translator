class Article < ApplicationRecord
    belongs_to :user
    belongs_to :language
    validates :name, presence: true
end

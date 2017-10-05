class ArticleMaterial < ApplicationRecord
    belongs_to :article
    has_attached_file :material
end

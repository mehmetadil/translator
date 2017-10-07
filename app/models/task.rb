class Task < ApplicationRecord
  belongs_to :offer
  belongs_to :user
  belongs_to :article
  belongs_to :language
end

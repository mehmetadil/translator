class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :article
  has_one :task
end

class Offer < ApplicationRecord
  enum status: { pending: 0, accepted: 1 }
  belongs_to :translator, foreign_key: 'translator_id', class_name: 'User'
  has_one :task, dependent: :destroy
  belongs_to :translate_order
end

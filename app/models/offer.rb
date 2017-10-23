class Offer < ApplicationRecord
  enum status: [ :accepted, :pending ]
  belongs_to :translator, :foreign_key => :translator_id, :primary_key => :id, :class_name => 'User'
  has_one :task
  belongs_to :translate_order
end

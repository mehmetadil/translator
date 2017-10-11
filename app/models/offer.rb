class Offer < ApplicationRecord
  belongs_to :translator, :foreign_key => :translator_id, :primary_key => :id, :class_name => 'User'
  has_one :task
  belongs_to :translate_order

  def is_not_accepted?
    self.status != "Accepted"
  end
end

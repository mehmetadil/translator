class Offer < ApplicationRecord
  enum status: { pending: 0, accepted: 1 }
  belongs_to :translator, foreign_key: 'translator_id', class_name: 'User'
  has_one :task, dependent: :destroy
  belongs_to :translate_order
  acts_as_notifiable :users,
    targets: ->(offer, key) {
      ([offer.translate_order.user]).uniq
    },
    tracked: true,
    notifiable_path: :translate_order_notifiable_path

  def translate_order_notifiable_path
    translate_order_path(translate_order)
  end
end

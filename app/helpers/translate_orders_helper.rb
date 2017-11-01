module TranslateOrdersHelper

  def self.order_belongs_to_user?(translate_order, current_user)
    translate_order.user == current_user
  end
end

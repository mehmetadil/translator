module ApplicationHelper
  def user_notifications
    # Kullanıcıya kendi hareketleri de bildirim olarak gidiyor.
    @notifications = 
                     if user_signed_in?
                       current_user.notifications.
                       where.not(notifier_id: current_user).
                       order('created_at desc')
                     end
  end

  def any_unread_notification?
    user_notifications.unopened_only.any? if user_signed_in?
  end
end

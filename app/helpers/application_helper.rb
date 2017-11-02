module ApplicationHelper

  def user_notifications
    @notifications = current_user.notifications if user_signed_in?
  end

  def any_unread_notification?
    user_notifications.unopened_only.any? if user_signed_in?
  end
end

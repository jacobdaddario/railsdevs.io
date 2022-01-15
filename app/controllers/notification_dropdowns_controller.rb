class NotificationDropdownsController < ApplicationController
  def show
    @notifications = current_user.notifications.unread.newest_first.limit(5)
  end
end

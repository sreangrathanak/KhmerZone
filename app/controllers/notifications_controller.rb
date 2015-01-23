class NotificationsController < ApplicationController

  def index
    @notifications = current_user.user_notices
  end

  def update_ischecks
    current_user.update_uncheck_notification
    redirect_to :back
  end

  def show
    notification=Notification.find params[:id]
    notification.update_unread
    redirect_to notification.notified
  end
end

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
    if notification.information =="following" || notification.information =="follow"
      redirect_to user_path(notification.notifier)
    else
      redirect_to user_product_path(notification.notified.user,notification.notified)      
    end
  end
end

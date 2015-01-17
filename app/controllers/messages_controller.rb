class MessagesController < ApplicationController
  before_action :user_auth

  def new
    @message=current_user.send_messages.build
  end

  def create    
    @message=current_user.send_messages.new reciver_params
    if @message.save
       redirect_to root_url
    else
       redirect_to request.referrer || root_url
    end
  end
  
  def show
    @message=Message.find params[:id]
    if @message.unread?
      @message.update_attributes unread: false
    end
  end

  def index
    @messages_recive=current_user.recive_messages
    @messages_send=current_user.send_messages
  end

  def destroy
    message=Message.find params[id]
    message.destroy
    redirect_to root_url
  end

  private
    def reciver_params
      params.require(:message).permit(:reciver_name, :subject,:content)
    end
end

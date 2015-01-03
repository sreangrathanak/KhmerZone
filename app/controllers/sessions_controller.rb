class SessionsController < ApplicationController
  before_action :redirect_signed_in_user, except: [:destroy]
  
  def new
  end
  
  def create
    user = User.find_by_name params[:session][:name]
    if user && user.authenticate(params[:session][:password])
      sign_in user
      remember_me? ? remember(user) : forget(user)
      redirect_back_or_to root_path, success: "You have signed in."
    else
      flash.now[:danger] = "Wrong username or password!"
      render "new"
    end
  end
  
  def destroy
    sign_out if user_signed_in?
    redirect_to root_path, success: "You have signed out."
  end

  private

    def remember_me?
      params[:session][:remember_me] == "1" 
    end
end

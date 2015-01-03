class UsersController < ApplicationController  
  before_action :redirect_signed_in_user, only: [:new, :create]
  before_action :user_auth, except: [:new, :create]
  before_action :current_user_auth, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      redirect_to @user, success: "Thank you for signing up!"
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      redirect_to @user, success: "Your profile has been updated!"
    else
      render "edit"
    end
  end

  private

    def set_user
      @user = User.find params[:id]
    end

    def user_params
      params.require(:user).permit(:name, :email,
              :password, :password_confirmation)
    end
end

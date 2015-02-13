class UsersController < ApplicationController  
  before_action :redirect_signed_in_user, only: [:new, :create]
  before_action :user_auth, except: [:new, :create]
  before_action :current_user_auth, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :user_auth, only: [:edit, :update, :destroy,
                                        :following, :followers]
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

  def index    
    @users =User.search(params[:search]).paginate(:per_page => 16,
     :page => params[:page])
  end

  def show     
    @user = User.friendly.find params[:id]
    @products = @user.products.search(params[:search]).paginate(:per_page => 18,
     :page => params[:page])
  end

  def edit
    @user = User.friendly.find params[:id]
    respond_to do |format|
      #format.html {  }
      format.js
    end  
  end

  def update
    @user = User.friendly.find params[:id]
    old_url_name=@user.url_name    
    if @user.update_attributes user_params
      respond_to do |format|        
        format.html { redirect_to request.referrer }        
        if old_url_name !=@user.url_name
          format.js {render inline: "(window.location.href='http://localhost:3000/').reload();" }
        else
          format.js {render inline: "location.reload();" }
        end
      end
    else
      respond_to do |format|        
        format.js
      end
    end
  end

  def following
    @title = "Following"
    @user  = User.friendly.find params[:id]
    @users = @user.following.paginate(page: params[:page])
    render "show_follow"
  end

  def followers
    @title = "Followers"
    @user  = User.friendly.find params[:id]
    @users = @user.followers.paginate(page: params[:page])
    render "show_follow"
  end
  
  private

    def set_user
      @user = User.friendly.find params[:id]
    end
   
    def user_params
      params.require(:user).permit(:name, :email,
              :password, :password_confirmation,
              :image,:cover,:store_name,:url_name,
              :phone,:address,:location_id,:about,:category_ids=>[])
    end
end

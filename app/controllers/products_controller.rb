class ProductsController < ApplicationController 
  before_action :user_auth, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  def create
    @product = current_user.products.build product_params
    if @product.save
      flash[:success] = "Product created!"
      redirect_to root_url
    else      
      @user=current_user
      @products = current_user.products.paginate(page: params[:page])
      redirect_to user_path @user
    end
  end

  def destroy
    @product.destroy
    flash[:success] = "Product deleted"
    redirect_to request.referrer || root_url
  end

  private

    def product_params
      params.require(:product).permit(:name,:description,:price,:discount,
        :category_id,:picture)
    end
    def correct_user
      @product = current_user.products.find_by(id: params[:id])
      redirect_to root_url if @product.nil?
    end
end

class ProductsController < ApplicationController 
  before_action :user_auth, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def create
     @product = current_user.products.new product_params
      if @product.save
        flash[:success]="Product create"
        redirect_to root_url
      else
        flash[:danger]="Cannot create product"
        redirect_to request.referrer || root_url
      end    
  end

  def update
    @product = Product.find(params[:id])
      if @product.update_attributes product_params
        redirect_to root_url
      else
        render :action => "edit"
      end
  end

  def show
    @product= Product.find(params[:id])
    ###find product ID
  end

  def destroy
    Product.find(params[:id]).destroy
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

class ProductsController < ApplicationController 
  before_action :user_auth, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  def new
    @product=Product.new
    @product.product_images.build
    respond_to do |format|      
      format.js
    end 
  end

  def create
     @product = current_user.products.new product_params
      if @product.save
        respond_to do |format|        
          format.html { redirect_to request.referrer }
          format.js
        end
      else
        respond_to do |format|        
          format.js
        end
      end    
  end

  def edit
    @product=Product.find params[:id]
    respond_to do |format|      
      format.js
    end 
  end

  def update
      @product=Product.find params[:id]
      if @product.update_attributes product_params
        respond_to do |format|        
          format.html { redirect_to request.referrer }
          format.js
        end
      else
        respond_to do |format|        
          format.js
        end
      end
  end

  def show
    @product= Product.find(params[:id])    
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted"
    redirect_to root_url
  end

  private

    def product_params
      params.require(:product).permit(:name,:description,:price,:discount,
        :picture,:category_ids=>[],
        product_images_attributes: [:id, :path, :_destroy])
    end
    def correct_user
      @product = current_user.products.find_by(id: params[:id])
      redirect_to root_url if @product.nil?
    end
end

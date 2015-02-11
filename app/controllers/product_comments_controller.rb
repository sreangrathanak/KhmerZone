class ProductCommentsController < ApplicationController
  before_action :user_auth, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
     
    @product_comment=ProductComment.new product_comment_params
      respond_to do |format|
        if @product_comment.save        
          #redirect_to request.referrer || root_url
          format.html { redirect_to(request.referrer,
            :notice => "Comment was successfully created.") }          
          format.js
        else        
          #redirect_to request.referrer || root_url
          format.html { redirect_to(request.referrer || root_url,
            :notice => "Comment was unsuccessfully created.") }          
          format.js
        end
      end
  end

  def destroy
    product_comment=ProductComment.find params[:id]
    @product_comment_id=product_comment.id
    respond_to do |format|
      product_comment.destroy
      format.html { redirect_to(request.referrer || root_url,
            :notice => "Comment was successfully delete.") }          
      format.js      
    end
  end

  def edit
    @product_comment=ProductComment.find params[:id]    
    @product=@product_comment.product    
    respond_to do |format|
      format.html { redirect_to(request.referrer || root_url,
            :notice => "") }          
      format.js      
    end
  end
  
  def update
    @product_comment=ProductComment.find params[:id]
    @product_comment.update_attributes product_comment_params
    @product=@product_comment.product    
    respond_to do |format|
      format.html { redirect_to(request.referrer || root_url,
            :notice => "") }          
      format.js      
    end
  end

  private
    def product_comment_params
      params.require(:product_comment).permit(:user_id,:product_id,:content)
    end

    def correct_user
      @product_comment = current_user.product_comments.find_by(id: params[:id])
      redirect_to root_url if @product_comment.nil?
    end
end

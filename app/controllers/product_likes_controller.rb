class ProductLikesController < ApplicationController

  def create
    product_like = current_user.product_likes.build product_id: params[:product_id]
    @product=product_like.product
    product_like.save

    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js
    end    
  end

  def destroy
    product_like = ProductLike.find(params[:id])
    @product=product_like.product
    product_like.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer}
      format.js
    end    
  end
end

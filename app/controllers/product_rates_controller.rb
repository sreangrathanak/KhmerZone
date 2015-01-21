class ProductRatesController < ApplicationController


  def update
    @rating = ProductRate.find(params[:id])
    @product = Product.find params[:product_rate][:product_id]
    @rating.update_attributes pruduct_rate_params
                  
    respond_to do |format|
      if @rating.save
        format.json { render :json => { :avg_rating => @product.avg_rating} }
      else
        format.json { render :json => @rating.errors, :status => :unprocessable_entity }
      end
    end    
  end

  private
    def pruduct_rate_params
      params.require(:product_rate).permit(:product_id, :user_id,:rate)
    end
end

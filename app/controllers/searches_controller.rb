class SearchesController < ApplicationController
  def advance_search_form
    
  end

  def advance_search     
    @search_products ||= Product.product_advance_search(params[:keywords],
                    params[:category_ids],params[:min_price],
                    params[:max_price])    
  end
  
  def product_search
    @products =Product.search(params[:search]).paginate(:per_page => 18,
     :page => params[:page])
  end  
end

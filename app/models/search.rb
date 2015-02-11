class Search < ActiveRecord::Base
  def products
    @products ||= find_products
  end

  private
    def find_products
      products = Product.order(:name)
      products = Product.where("name like ?", "%#{keywords}%") if keywords.present?
      products = Product.where(category_id: category_id) if category_id.present?
      products = Product.where("price >= ?", min_price) if min_price.present?
      products = Product.where("price <= ?", max_price) if max_price.present?
      products
    end
end

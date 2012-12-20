class ProductsController < InheritedResources::Base
  
  def show_campaign
    @product = Product.find_by_id(params[:product_id])
  end
end

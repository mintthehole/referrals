class StoresController < InheritedResources::Base
	def advertise
		@store = Store.find_by_id(params[:id])
		@product = Product.find_by_id(params[:product_id])
	end
end

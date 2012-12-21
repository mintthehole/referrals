class CustomerLead < ActiveRecord::Base
  attr_accessible :info, :parent_product_id, :product_id
  def self.build(params)
  	hash = {:info => params[:info], 
  			:parent_product_id => params[:parent_product_id], :product_id => params[:product_id]}
	new(hash)  	
  end
end

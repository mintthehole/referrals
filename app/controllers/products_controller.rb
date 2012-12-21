class ProductsController < InheritedResources::Base
  
  def show_campaign
    @product = Product.find_by_id(params[:product_id])
  end

  def customer_lead
  	lead = CustomerLead.build(params)
  	lead.save
  	respond_to do |format|
	    format.xml { render :xml =>lead, :status => :ok }
    	format.json { render :json => lead, :status => :ok }
    end
  end
end

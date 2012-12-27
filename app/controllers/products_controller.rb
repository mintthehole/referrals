class ProductsController < ApplicationController
  
  def show_campaign
    @product = Product.find_by_id(params[:product_id])
  end

  def customer_lead
  	lead = CustomerLead.build(params)
  	lead.save
    parent_product = Product.find_by_id(params[:parent_product_id])
    SmsApi.send(params[:info],"User Prototype No:#{params[:info]} Product:#{parent_product.name.truncate(32)} Time:#{Time.zone.now}")
    
    SmsApi.send(parent_product.phone_no,"#{parent_product.name} Prototype No:#{params[:info]} Time:#{Time.zone.now}")
    product = Product.find_by_id(params[:product_id])
    SmsApi.send(product.phone_no,"#{product.name} Prototype No:#{params[:info]} Time:#{Time.zone.now}")

  	respond_to do |format|
	    format.xml { render :xml =>lead, :status => :ok }
    	format.json { render :json => lead, :status => :ok }
    end
  end

  def feedback
    fb = Feedback.build(params)
    fb.save
    respond_to do |format|
      format.xml { render :xml =>fb, :status => :ok }
      format.json { render :json => fb, :status => :ok }
    end
  end
 
 end

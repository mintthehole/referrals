class ProductsController < ApplicationController
  
  def show_campaign
    @product = Product.find_by_id(params[:product_id])
  end

  def customer_lead
  	lead = CustomerLead.build(params)
  	lead.save
    parent_product = Product.find_by_id(params[:parent_product_id])
    product = Product.find_by_id(params[:product_id])
    SmsApi.send(params[:info],"User Proto No:#{params[:info]} PID:#{product.name.truncate(32)} Dt:#{Date.today}")
    SmsApi.send(parent_product.phone_no,"#{parent_product.name.truncate(32)} Proto No:#{params[:info]} Dt:#{Date.today}")
    SmsApi.send(product.phone_no,"#{product.name.truncate(32)} Proto No:#{params[:info]} Dt:#{Date.today}")

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

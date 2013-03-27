require 'will_paginate/array'

class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def show_campaign
    @product = Product.find_by_id(params[:product_id])
  end

  def show_menu
    @product = Product.find_by_id(params[:product_id])
    @items = Item.find(:all, :conditions => ['product_id = ?', @product.id], :order => 'priority').paginate(:per_page => 5, :page =>params[:page])
  end

  def item_checkout
    @check_out_hash = params["_json"]
    @product = Product.find_by_id(params[:product_id])
    @items = []
    @quantities ={}
    @check_out_hash.each do |item|
      if item["quantity"].to_i != 0
        @items << Item.find_by_id(item["item_id"].to_i)
        @quantities[item["item_id"].to_i] = item["quantity"].to_i
      end
    end
    render :partial => 'item_checkout'
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
  
  def email_me
    @check_out_hash = params["_json"]
    @product = Product.find_by_id(params[:product_id])
    @items = []
    @quantities ={}
    @check_out_hash.each do |item|
      if item["quantity"].to_i != 0
        @items << Item.find_by_id(item["item_id"].to_i)
        @quantities[item["item_id"].to_i] = item["quantity"].to_i
      end
    end
    BillMailer.send_mail(params[:email],@product, @items, @quantities).deliver
    respond_to do |format|
      format.xml { render :xml =>"true", :status => :ok }
      format.json { render :json => "true", :status => :ok }
    end
  end

  def show
    @product = Product.find(params[:id])
  end
 end

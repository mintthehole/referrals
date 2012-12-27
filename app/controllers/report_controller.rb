class ReportController < ApplicationController
  before_filter :authenticate_user!
  def report
  end

  def ratings
  end

  def call_me
  end

  def call_me_report
  	@from_product_id = params[:call_me_report][:from_product_id]
  	@to_product_id = params[:call_me_report][:to_product_id]
	@customer_leads = CustomerLead.report(@from_product_id, @to_product_id)
  	render :partial =>'call_me_report'
  end

  def rating_report
  	@product_id = params[:rating_report][:product_id]
  	unless @product_id.nil? 
  		@product = Product.find_by_id(@product_id)
  		@ratings_avg = Feedback.average(:rating, :conditions => ['product_id = ?',@product.id])
  		@ratings = Feedback.find_all_by_product_id(@product.id)
  	end
  	render :partial =>'rating_report'
  end

end

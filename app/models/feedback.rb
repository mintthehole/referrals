class Feedback < ActiveRecord::Base
  attr_accessible :product_id, :rating

  def self.build(params)
  	new({:product_id =>params[:product_id], :rating => params[:rating]})
  end
end

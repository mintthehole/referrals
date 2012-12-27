class CustomerLead < ActiveRecord::Base
  attr_accessible :info, :parent_product_id, :product_id
  belongs_to :source_product, :class_name => "Product", :foreign_key => :parent_product_id
  belongs_to :product

  def mobile_number
    self.info
  end

  def self.build(params)
  	hash = {:info => params[:info], 
  			:parent_product_id => params[:parent_product_id], :product_id => params[:product_id]}
	 new(hash)  	
  end

  def self.report(from,to)
    conditions = ['info is not null']
    unless from.blank?
      conditions[0] << ' AND parent_product_id = ? '
      conditions << from
    end
    unless to.blank?
      conditions[0] << ' AND product_id = ? '
      conditions << to
    end
    self.find(:all, :conditions => conditions, :order => 'id desc')
  end

end

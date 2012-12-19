class CustomerLead < ActiveRecord::Base
  attr_accessible :info, :parent_product_id, :product_id
end

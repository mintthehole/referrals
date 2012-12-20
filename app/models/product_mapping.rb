class ProductMapping < ActiveRecord::Base
  attr_accessible  :product_id, :related_product_id

  belongs_to :product
  belongs_to :related_product, :class_name => 'Product'

end

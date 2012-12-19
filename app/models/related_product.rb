class RelatedProduct < ActiveRecord::Base
  attr_accessible :product_id, :rel_product_id
  belongs_to :product

end

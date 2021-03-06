class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :name, :store_id, :phone_no, :sales_tax, :vat, :service_tax
  

  belongs_to :store
  has_many :links,     :foreign_key => 'product_id',
                       :class_name => 'ProductMapping',
                       :dependent => :destroy

  has_many :related_products, :through => :links
end

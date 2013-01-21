class Item < ActiveRecord::Base
  attr_accessible :avg_rating, :description, :name, :price, :priority, :promote, :sales_tax, :service_tax, :vat, :product_id
end

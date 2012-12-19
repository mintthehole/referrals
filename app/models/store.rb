class Store < ActiveRecord::Base
  attr_accessible :description, :location_name, :logo_url, :name
  has_many :products
  
end

class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :name, :store_id

  belongs_to :store
  has_many :related_products

end

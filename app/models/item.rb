class Item < ActiveRecord::Base
  attr_accessible :avg_rating, :description, :name, :price, :priority, :promote, :product_id
  def quantity=(quantity)
  end
end

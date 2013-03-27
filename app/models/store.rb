class Store < ActiveRecord::Base
  attr_accessible :description, :location_name, :logo_url, :name, :mobile_number
  has_many :products
  STRATA_STORE = Store.find_by_name('Strata').try(:id)
end

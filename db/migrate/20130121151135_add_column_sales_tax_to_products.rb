class AddColumnSalesTaxToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :vat, :float
  	add_column :products, :service_tax, :float
    add_column :products, :sales_tax, :float
  end
end

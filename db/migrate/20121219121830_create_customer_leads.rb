class CreateCustomerLeads < ActiveRecord::Migration
  def change
    create_table :customer_leads do |t|
      t.text :info
      t.integer :product_id
      t.integer :parent_product_id

      t.timestamps
    end
  end
end

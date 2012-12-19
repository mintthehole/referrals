class CreateRelatedProducts < ActiveRecord::Migration
  def change
    create_table :related_products do |t|
      t.integer :product_id
      t.integer :rel_product_id
      t.timestamps
    end
  end
end

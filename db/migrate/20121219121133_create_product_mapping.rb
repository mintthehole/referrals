class CreateProductMapping < ActiveRecord::Migration
  def change
    create_table :product_mappings do |t|
      t.integer :product_id
      t.integer :related_product_id
      t.timestamps
    end
  end
end

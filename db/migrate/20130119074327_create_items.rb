class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :priority
      t.float :avg_rating
      t.float :vat
      t.float :sales_tax
      t.float :service_tax
      t.string :promote
      t.integer :product_id
      t.timestamps
    end
  end
end

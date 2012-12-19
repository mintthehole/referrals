class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.text :description
      t.string :logo_url
      t.string :location_name

      t.timestamps
    end
  end
end

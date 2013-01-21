ActiveAdmin.register Item do
  index do
    column :id
    column :name
    column :description
    column :price
    column :product_id
    column :updated_at
    default_actions
  end
  
  form do |f|
    f.inputs "Enter Item Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :priority
      f.input :promote
      f.input :product_id
    end
    f.buttons
  end
end

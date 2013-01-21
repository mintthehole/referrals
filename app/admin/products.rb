ActiveAdmin.register Product do
  index do
    column :id
    column :name do |p|
      link_to p.name, admin_product_path(p)
    end
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs "Enter Product Details" do
      f.input :name
      f.input :description
      f.input :image_url
      f.input :phone_no
      f.input :sales_tax
      f.input :service_tax
      f.input :vat
      f.input :store
    end
    f.buttons
  end
end


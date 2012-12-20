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
end


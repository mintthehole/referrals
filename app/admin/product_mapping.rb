ActiveAdmin.register ProductMapping do
  index do
    column :id
    column :product
    column :related_product
    column :created_at
    column :updated_at
    default_actions
  end
end

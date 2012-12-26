ActiveAdmin.register CustomerLead do
  actions :index

  index do
    column :id
    column :product
    column :mobile_number
    column :source_product

    column :created_at
    column :updated_at
    # default_actions
  end
end

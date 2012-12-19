# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer_lead do
    info "MyText"
    product_id 1
    parent_product_id 1
  end
end

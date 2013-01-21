# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    name "MyString"
    description "MyText"
    price 1.5
    priority 1
    avg_rating 1.5
    vat 1.5
    sales_tax 1.5
    service_tax 1.5
    promote "MyString"
  end
end

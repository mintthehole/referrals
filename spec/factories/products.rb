# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyString"
    description "MyText"
    image_url "MyString"
    store_id 1
  end
end

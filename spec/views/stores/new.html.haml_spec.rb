require 'spec_helper'

describe "stores/new" do
  before(:each) do
    assign(:store, stub_model(Store,
      :name => "MyString",
      :description => "MyText",
      :logo_url => "MyString",
      :location_name => "MyString"
    ).as_new_record)
  end

  it "renders new store form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stores_path, :method => "post" do
      assert_select "input#store_name", :name => "store[name]"
      assert_select "textarea#store_description", :name => "store[description]"
      assert_select "input#store_logo_url", :name => "store[logo_url]"
      assert_select "input#store_location_name", :name => "store[location_name]"
    end
  end
end

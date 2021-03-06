require 'spec_helper'

describe "stores/index" do
  before(:each) do
    assign(:stores, [
      stub_model(Store,
        :name => "Name",
        :description => "MyText",
        :logo_url => "Logo Url",
        :location_name => "Location Name"
      ),
      stub_model(Store,
        :name => "Name",
        :description => "MyText",
        :logo_url => "Logo Url",
        :location_name => "Location Name"
      )
    ])
  end

  it "renders a list of stores" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Logo Url".to_s, :count => 2
    assert_select "tr>td", :text => "Location Name".to_s, :count => 2
  end
end

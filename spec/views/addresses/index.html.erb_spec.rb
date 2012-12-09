require 'spec_helper'

describe "addresses/index" do
  before(:each) do
    assign(:addresses, [
      stub_model(Address,
        :country_id => "Country",
        :region_id => "Region",
        :city_id => "City",
        :settlement_id => "Settlement",
        :district_id => "District",
        :street_id => "Street",
        :house => "House",
        :flat => "Flat"
      ),
      stub_model(Address,
        :country_id => "Country",
        :region_id => "Region",
        :city_id => "City",
        :settlement_id => "Settlement",
        :district_id => "District",
        :street_id => "Street",
        :house => "House",
        :flat => "Flat"
      )
    ])
  end

  it "renders a list of addresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Region".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Settlement".to_s, :count => 2
    assert_select "tr>td", :text => "District".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "House".to_s, :count => 2
    assert_select "tr>td", :text => "Flat".to_s, :count => 2
  end
end

require 'spec_helper'

describe "addresses/show" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :country_id => "Country",
      :region_id => "Region",
      :city_id => "City",
      :settlement_id => "Settlement",
      :district_id => "District",
      :street_id => "Street",
      :house => "House",
      :flat => "Flat"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Country/)
    rendered.should match(/Region/)
    rendered.should match(/City/)
    rendered.should match(/Settlement/)
    rendered.should match(/District/)
    rendered.should match(/Street/)
    rendered.should match(/House/)
    rendered.should match(/Flat/)
  end
end

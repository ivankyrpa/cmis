require 'spec_helper'

describe "addresses/edit" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :country_id => "MyString",
      :region_id => "MyString",
      :city_id => "MyString",
      :settlement_id => "MyString",
      :district_id => "MyString",
      :street_id => "MyString",
      :house => "MyString",
      :flat => "MyString"
    ))
  end

  it "renders the edit address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => addresses_path(@address), :method => "post" do
      assert_select "input#address_country_id", :name => "address[country_id]"
      assert_select "input#address_region_id", :name => "address[region_id]"
      assert_select "input#address_city_id", :name => "address[city_id]"
      assert_select "input#address_settlement_id", :name => "address[settlement_id]"
      assert_select "input#address_district_id", :name => "address[district_id]"
      assert_select "input#address_street_id", :name => "address[street_id]"
      assert_select "input#address_house", :name => "address[house]"
      assert_select "input#address_flat", :name => "address[flat]"
    end
  end
end

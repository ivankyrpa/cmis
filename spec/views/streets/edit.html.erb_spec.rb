require 'spec_helper'

describe "streets/edit" do
  before(:each) do
    @street = assign(:street, stub_model(Street,
      :name => "MyString"
    ))
  end

  it "renders the edit street form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => streets_path(@street), :method => "post" do
      assert_select "input#street_name", :name => "street[name]"
    end
  end
end

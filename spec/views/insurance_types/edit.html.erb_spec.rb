require 'spec_helper'

describe "insurance_types/edit" do
  before(:each) do
    @insurance_type = assign(:insurance_type, stub_model(InsuranceType,
      :name => "MyString"
    ))
  end

  it "renders the edit insurance_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => insurance_types_path(@insurance_type), :method => "post" do
      assert_select "input#insurance_type_name", :name => "insurance_type[name]"
    end
  end
end

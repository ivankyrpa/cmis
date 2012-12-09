require 'spec_helper'

describe "insurance_types/new" do
  before(:each) do
    assign(:insurance_type, stub_model(InsuranceType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new insurance_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => insurance_types_path, :method => "post" do
      assert_select "input#insurance_type_name", :name => "insurance_type[name]"
    end
  end
end

require 'spec_helper'

describe "insurance_types/index" do
  before(:each) do
    assign(:insurance_types, [
      stub_model(InsuranceType,
        :name => "Name"
      ),
      stub_model(InsuranceType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of insurance_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

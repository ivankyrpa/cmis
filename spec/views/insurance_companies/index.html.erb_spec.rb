require 'spec_helper'

describe "insurance_companies/index" do
  before(:each) do
    assign(:insurance_companies, [
      stub_model(InsuranceCompany,
        :name => "Name"
      ),
      stub_model(InsuranceCompany,
        :name => "Name"
      )
    ])
  end

  it "renders a list of insurance_companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

require 'spec_helper'

describe "insurance_companies/show" do
  before(:each) do
    @insurance_company = assign(:insurance_company, stub_model(InsuranceCompany,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end

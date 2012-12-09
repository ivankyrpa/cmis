require 'spec_helper'

describe "insurance_types/show" do
  before(:each) do
    @insurance_type = assign(:insurance_type, stub_model(InsuranceType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end

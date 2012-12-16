require 'spec_helper'

describe "policies/show" do
  before(:each) do
    @policy = assign(:policy, stub_model(Policy,
      :number => "Number",
      :insurance_company_id => 1,
      :insurance_type_id => 2,
      :pacient_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Number/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end

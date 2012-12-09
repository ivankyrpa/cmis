require 'spec_helper'

describe "treatment_types/show" do
  before(:each) do
    @treatment_type = assign(:treatment_type, stub_model(TreatmentType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end

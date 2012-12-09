require 'spec_helper'

describe "blood_groups/show" do
  before(:each) do
    @blood_group = assign(:blood_group, stub_model(BloodGroup,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end

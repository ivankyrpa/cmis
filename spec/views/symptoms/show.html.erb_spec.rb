require 'spec_helper'

describe "symptoms/show" do
  before(:each) do
    @symptom = assign(:symptom, stub_model(Symptom,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end

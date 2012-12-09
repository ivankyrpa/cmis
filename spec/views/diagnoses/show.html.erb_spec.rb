require 'spec_helper'

describe "diagnoses/show" do
  before(:each) do
    @diagnosis = assign(:diagnosis, stub_model(Diagnosis,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end

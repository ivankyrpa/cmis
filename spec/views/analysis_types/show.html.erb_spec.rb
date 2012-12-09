require 'spec_helper'

describe "analysis_types/show" do
  before(:each) do
    @analysis_type = assign(:analysis_type, stub_model(AnalysisType,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end

require 'spec_helper'

describe "analysis_types/index" do
  before(:each) do
    assign(:analysis_types, [
      stub_model(AnalysisType,
        :name => "Name"
      ),
      stub_model(AnalysisType,
        :name => "Name"
      )
    ])
  end

  it "renders a list of analysis_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

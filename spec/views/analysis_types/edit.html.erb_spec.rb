require 'spec_helper'

describe "analysis_types/edit" do
  before(:each) do
    @analysis_type = assign(:analysis_type, stub_model(AnalysisType,
      :name => "MyString"
    ))
  end

  it "renders the edit analysis_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => analysis_types_path(@analysis_type), :method => "post" do
      assert_select "input#analysis_type_name", :name => "analysis_type[name]"
    end
  end
end

require 'spec_helper'

describe "analysis_types/new" do
  before(:each) do
    assign(:analysis_type, stub_model(AnalysisType,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new analysis_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => analysis_types_path, :method => "post" do
      assert_select "input#analysis_type_name", :name => "analysis_type[name]"
    end
  end
end

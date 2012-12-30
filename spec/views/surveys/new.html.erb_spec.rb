require 'spec_helper'

describe "surveys/new" do
  before(:each) do
    assign(:survey, stub_model(Survey,
      :pacient_id => 1
    ).as_new_record)
  end

  it "renders new survey form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => surveys_path, :method => "post" do
      assert_select "input#survey_pacient_id", :name => "survey[pacient_id]"
    end
  end
end

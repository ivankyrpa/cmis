require 'spec_helper'

describe "surveys/edit" do
  before(:each) do
    @survey = assign(:survey, stub_model(Survey,
      :pacient_id => 1
    ))
  end

  it "renders the edit survey form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => surveys_path(@survey), :method => "post" do
      assert_select "input#survey_pacient_id", :name => "survey[pacient_id]"
    end
  end
end

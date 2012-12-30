require 'spec_helper'

describe "characteristics_surveys/new" do
  before(:each) do
    assign(:characteristics_survey, stub_model(CharacteristicsSurvey,
      :survey_id => 1,
      :characteristic_id => 1,
      :value => 1.5,
      :result => 1
    ).as_new_record)
  end

  it "renders new characteristics_survey form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => characteristics_surveys_path, :method => "post" do
      assert_select "input#characteristics_survey_survey_id", :name => "characteristics_survey[survey_id]"
      assert_select "input#characteristics_survey_characteristic_id", :name => "characteristics_survey[characteristic_id]"
      assert_select "input#characteristics_survey_value", :name => "characteristics_survey[value]"
      assert_select "input#characteristics_survey_result", :name => "characteristics_survey[result]"
    end
  end
end

require 'spec_helper'

describe "characteristics_surveys/show" do
  before(:each) do
    @characteristics_survey = assign(:characteristics_survey, stub_model(CharacteristicsSurvey,
      :survey_id => 1,
      :characteristic_id => 2,
      :value => 1.5,
      :result => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/1.5/)
    rendered.should match(/3/)
  end
end

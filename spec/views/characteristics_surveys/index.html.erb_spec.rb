require 'spec_helper'

describe "characteristics_surveys/index" do
  before(:each) do
    assign(:characteristics_surveys, [
      stub_model(CharacteristicsSurvey,
        :survey_id => 1,
        :characteristic_id => 2,
        :value => 1.5,
        :result => 3
      ),
      stub_model(CharacteristicsSurvey,
        :survey_id => 1,
        :characteristic_id => 2,
        :value => 1.5,
        :result => 3
      )
    ])
  end

  it "renders a list of characteristics_surveys" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end

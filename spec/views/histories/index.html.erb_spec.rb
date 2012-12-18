require 'spec_helper'

describe "histories/index" do
  before(:each) do
    assign(:histories, [
      stub_model(History,
        :pacient_id => 1,
        :diagnosis_id => 2,
        :treatment_type_id => 3,
        :user_id => 4,
        :number => "Number",
        :description => "MyText"
      ),
      stub_model(History,
        :pacient_id => 1,
        :diagnosis_id => 2,
        :treatment_type_id => 3,
        :user_id => 4,
        :number => "Number",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of histories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

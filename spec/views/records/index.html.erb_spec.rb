require 'spec_helper'

describe "records/index" do
  before(:each) do
    assign(:records, [
      stub_model(Record,
        :pacient_id => 1,
        :assignment_id => 2,
        :diagnosis_id => 3,
        :complaints => "MyText",
        :recommendation => "MyText",
        :doctor_name => "Doctor Name"
      ),
      stub_model(Record,
        :pacient_id => 1,
        :assignment_id => 2,
        :diagnosis_id => 3,
        :complaints => "MyText",
        :recommendation => "MyText",
        :doctor_name => "Doctor Name"
      )
    ])
  end

  it "renders a list of records" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Doctor Name".to_s, :count => 2
  end
end

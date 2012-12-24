require 'spec_helper'

describe "characteristics/index" do
  before(:each) do
    assign(:characteristics, [
      stub_model(Characteristic,
        :group_id => 1,
        :name => "Name",
        :first_value => 1.5,
        :second_value => 1.5
      ),
      stub_model(Characteristic,
        :group_id => 1,
        :name => "Name",
        :first_value => 1.5,
        :second_value => 1.5
      )
    ])
  end

  it "renders a list of characteristics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end

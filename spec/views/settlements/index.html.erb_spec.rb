require 'spec_helper'

describe "settlements/index" do
  before(:each) do
    assign(:settlements, [
      stub_model(Settlement,
        :name => "Name"
      ),
      stub_model(Settlement,
        :name => "Name"
      )
    ])
  end

  it "renders a list of settlements" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

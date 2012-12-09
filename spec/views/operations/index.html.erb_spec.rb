require 'spec_helper'

describe "operations/index" do
  before(:each) do
    assign(:operations, [
      stub_model(Operation,
        :name => "Name"
      ),
      stub_model(Operation,
        :name => "Name"
      )
    ])
  end

  it "renders a list of operations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

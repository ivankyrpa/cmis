require 'spec_helper'

describe "streets/index" do
  before(:each) do
    assign(:streets, [
      stub_model(Street,
        :name => "Name"
      ),
      stub_model(Street,
        :name => "Name"
      )
    ])
  end

  it "renders a list of streets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

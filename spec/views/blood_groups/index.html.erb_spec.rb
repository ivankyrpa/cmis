require 'spec_helper'

describe "blood_groups/index" do
  before(:each) do
    assign(:blood_groups, [
      stub_model(BloodGroup,
        :name => "Name"
      ),
      stub_model(BloodGroup,
        :name => "Name"
      )
    ])
  end

  it "renders a list of blood_groups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

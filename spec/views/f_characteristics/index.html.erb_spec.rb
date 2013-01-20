require 'spec_helper'

describe "f_characteristics/index" do
  before(:each) do
    assign(:f_characteristics, [
      stub_model(FCharacteristic,
        :group_id => 1,
        :name => "Name",
        :norm_c => 1.5,
        :norm_sc => 1.5,
        :norm_dc => 1.5,
        :dev_c => 1.5,
        :dev_sc => 1.5,
        :dev_dc => 1.5
      ),
      stub_model(FCharacteristic,
        :group_id => 1,
        :name => "Name",
        :norm_c => 1.5,
        :norm_sc => 1.5,
        :norm_dc => 1.5,
        :dev_c => 1.5,
        :dev_sc => 1.5,
        :dev_dc => 1.5
      )
    ])
  end

  it "renders a list of f_characteristics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end

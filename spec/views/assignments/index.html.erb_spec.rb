require 'spec_helper'

describe "assignments/index" do
  before(:each) do
    assign(:assignments, [
      stub_model(Assignment,
        :record_id => 1,
        :history_id => 2,
        :medicament_id => 3,
        :amount => "9.99"
      ),
      stub_model(Assignment,
        :record_id => 1,
        :history_id => 2,
        :medicament_id => 3,
        :amount => "9.99"
      )
    ])
  end

  it "renders a list of assignments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end

require 'spec_helper'

describe "symptoms/index" do
  before(:each) do
    assign(:symptoms, [
      stub_model(Symptom,
        :name => "Name"
      ),
      stub_model(Symptom,
        :name => "Name"
      )
    ])
  end

  it "renders a list of symptoms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
